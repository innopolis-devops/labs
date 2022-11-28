pub mod visits;

use chrono_tz::Tz;
use serde::Deserialize;
use std::{fs::File, io::BufReader};

#[derive(Deserialize)]
pub struct Settings {
    #[serde(skip_deserializing)]
    #[serde(default = "tz_default")]
    pub time_zone: Tz,
    #[serde(default = "format_default")]
    pub time_format: String,
    pub visits_file_path: String,
}

fn tz_default() -> Tz {
    "Europe/Moscow".parse().unwrap()
}

fn format_default() -> String {
    "%H:%M:%S".to_string()
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            time_zone: tz_default(),
            time_format: format_default(),
            visits_file_path: "./visits.json".to_string(),
        }
    }
}

impl Settings {
    pub fn from_file(path: &str) -> Result<Self, anyhow::Error> {
        let file = File::open(path)?;
        let reader = BufReader::new(file);
        let config = serde_json::from_reader(reader)?;
        Ok(config)
    }
}
