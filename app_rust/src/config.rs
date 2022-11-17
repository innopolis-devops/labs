use serde::Deserialize;
use tokio::io::AsyncReadExt;

#[derive(Deserialize)]
pub struct Config {
    pub visits_file_path: String,
}

impl Default for Config {
    fn default() -> Self {
        Self {
            visits_file_path: "persistent/visits.json".to_owned(),
        }
    }
}

impl Config {
    pub async fn read_from_file_path(path: &str) -> std::io::Result<Self> {
        let mut file = tokio::fs::OpenOptions::new().read(true).open(path).await?;
        let mut buf = vec![];
        file.read_to_end(&mut buf).await?;
        serde_json::from_slice(&buf).map_err(|e| e.into())
    }
}
