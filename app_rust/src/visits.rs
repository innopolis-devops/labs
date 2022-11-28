use serde::{Deserialize, Serialize};
use std::{
    fs::{File, OpenOptions},
    io::{Read, Seek, Write},
};

#[derive(Deserialize, Serialize, Debug, Default)]
struct VisistsFile {
    visits: Vec<String>,
}

pub struct VisistsLogger {
    file: File,
}

impl VisistsLogger {
    pub fn new(path: &str) -> Result<Self, std::io::Error> {
        println!("creating file");
        let file = OpenOptions::new()
            .read(true)
            .write(true)
            .append(false)
            .create(true)
            .open(path)?;
        println!("created");
        Ok(Self { file })
    }

    pub fn get_visists(&mut self) -> Result<String, std::io::Error> {
        let mut content = String::new();
        self.file.seek(std::io::SeekFrom::Start(0))?;
        self.file.read_to_string(&mut content)?;
        Ok(content)
    }

    pub fn write_visit(&mut self, time: &str) -> Result<(), std::io::Error> {
        let content = self.get_visists()?;
        let mut v: VisistsFile = serde_json::from_str(&content).unwrap_or_default();
        v.visits.push(time.to_string());
        let v = serde_json::to_string(&v)?;
        self.file.seek(std::io::SeekFrom::Start(0))?;
        self.file.write_all(v.as_bytes())?;
        Ok(())
    }
}
