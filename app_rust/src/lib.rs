use chrono_tz::Tz;

pub struct Settings {
    pub time_zone: Tz,
    pub time_format: String,
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            time_zone: "Europe/Moscow".parse().unwrap(),
            time_format: "%H:%M:%S".into(),
        }
    }
}
