use std::{io::SeekFrom, marker::PhantomData};

use serde::{de::DeserializeOwned, Serialize};
use tokio::{
    fs::File,
    io::{AsyncReadExt, AsyncSeekExt, AsyncWriteExt},
};

#[async_trait::async_trait]
pub trait Log<TEntry> {
    async fn push(&mut self, entry: TEntry) -> Result<()>;
    async fn as_vec(&mut self) -> Result<Vec<TEntry>>;
    async fn len(&mut self) -> Result<usize>;
}

#[derive(thiserror::Error, Debug)]
pub enum Error {
    #[error("failure when making a query or getting a response")]
    IO(#[from] std::io::Error),
    #[error("couldn't parse the response")]
    Serialization(#[from] serde_json::Error),
}

pub type Result<T> = core::result::Result<T, Error>;

pub struct Mock<TEntry> {
    data: Vec<TEntry>,
}

impl<T> Mock<T> {
    #[allow(dead_code)]
    pub fn new() -> Self {
        Self { data: vec![] }
    }
}

#[async_trait::async_trait]
impl<TEntry> Log<TEntry> for Mock<TEntry>
where
    TEntry: Send + Sync + Clone,
{
    async fn push(&mut self, e: TEntry) -> Result<()> {
        self.data.push(e);
        Ok(())
    }

    async fn as_vec(&mut self) -> Result<Vec<TEntry>> {
        Ok(self.data.clone())
    }

    async fn len(&mut self) -> Result<usize> {
        Ok(self.data.len())
    }
}

/// Push-only structure for storing data without deleting it.
/// Stores in `storage` (water is wet kek).
pub struct FileLog<TEntry> {
    file: File,
    phantom: PhantomData<TEntry>,
}

impl<TEntry> FileLog<TEntry>
where
    TEntry: Serialize + DeserializeOwned,
{
    pub async fn new(file: File) -> Result<Self> {
        let mut new_log = Self {
            file,
            phantom: PhantomData,
        };
        if let Err(Error::Serialization(_)) = new_log.read_whole_log().await {
            // If some fails in serialization - overwrite with empty
            new_log.overwrite_log(&vec![]).await?;
        }
        Ok(new_log)
    }

    async fn overwrite_log(&mut self, list: &Vec<TEntry>) -> Result<()> {
        let buf = serde_json::to_vec(list)?;
        let mut buf = std::io::Cursor::new(buf.as_slice());
        self.file.seek(SeekFrom::Start(0)).await?;
        self.file.write_all_buf(&mut buf).await?;
        let new_len = self.file.seek(SeekFrom::Current(0)).await?;
        self.file.set_len(new_len).await?;
        Ok(())
    }

    async fn read_whole_log(&mut self) -> Result<Vec<TEntry>> {
        let mut buf = vec![];
        self.file.seek(SeekFrom::Start(0)).await?;
        self.file.read_to_end(&mut buf).await?;
        serde_json::from_slice(&buf).map_err(|e| e.into())
    }
}

#[async_trait::async_trait]
impl<TEntry> Log<TEntry> for FileLog<TEntry>
where
    TEntry: Serialize + DeserializeOwned + Send + Sync,
{
    async fn push(&mut self, entry: TEntry) -> Result<()> {
        let mut current = self.read_whole_log().await?;
        current.push(entry);
        self.overwrite_log(&current).await?;
        Ok(())
    }

    async fn as_vec(&mut self) -> Result<Vec<TEntry>> {
        self.read_whole_log().await
    }

    async fn len(&mut self) -> Result<usize> {
        self.read_whole_log().await.map(|l| l.len())
    }
}

#[cfg(test)]
mod tests {
    use tokio::fs::OpenOptions;

    use super::*;

    async fn test_log<TLog>(log: &mut TLog) -> Result<()>
    where
        TLog: Log<String>,
    {
        let mut cur_log_vec = log.as_vec().await?;
        let test_vec = vec!["a", "b", "cde", "🥴🫣🫠"];
        for entry in test_vec {
            let entry = entry.to_owned();
            log.push(entry.clone()).await?;
            cur_log_vec.push(entry);
            assert_eq!(cur_log_vec, log.as_vec().await?);
        }
        Ok(())
    }

    // Using persistent storage in tests is an antipattern, so I'll leave it ignored
    // If needed one can mock file and return the tests.

    // Basically enable for some time if needed, don't want to leave it on
    #[ignore]
    #[tokio::test]
    async fn write_read_as_expected() {
        // Setting up
        let file = OpenOptions::new()
            .read(true)
            .write(true)
            .create(true)
            .open("visits.json")
            .await
            .unwrap();

        // Test
        let mut log = FileLog::<String>::new(file).await.unwrap();

        let sample_vec1: Vec<_> = ["a", "b", "cdef"]
            .into_iter()
            .map(|s| s.to_owned())
            .collect();

        log.overwrite_log(&sample_vec1).await.unwrap();

        let read_vec = log.read_whole_log().await.unwrap();

        assert_eq!(sample_vec1, read_vec);

        let sample_vec2: Vec<_> = ["a", "b"].into_iter().map(|s| s.to_owned()).collect();

        log.overwrite_log(&sample_vec2).await.unwrap();

        let read_vec = log.read_whole_log().await.unwrap();

        assert_eq!(sample_vec2, read_vec);
    }

    #[ignore]
    #[tokio::test]
    async fn test_file_log() {
        // Setting up
        let file = OpenOptions::new()
            .read(true)
            .write(true)
            .create(true)
            .open("visits.json")
            .await
            .unwrap();

        // Test
        let mut log = FileLog::<String>::new(file).await.unwrap();

        test_log(&mut log).await.unwrap();
    }

    #[tokio::test]
    async fn test_mock_log() {
        let mut log = Mock::<String>::new();

        test_log(&mut log).await.unwrap();
    }
}
