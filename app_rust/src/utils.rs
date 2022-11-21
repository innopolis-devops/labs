use std::fs;
use std::fs::OpenOptions;
use std::path::Path;
use std::io::prelude::*;

const MINUTE: i32 = 60;
const HOUR: i32 = 60 * MINUTE;

pub const MSC_TZ_OFFSET: i32 = 3 * HOUR;

const VISITS_PATH: &str = "visits.txt";

pub fn increment_visits() {
    let visits: u32 = current_visits() + 1;
    let data: String = visits.to_string();
    let mut f = OpenOptions::new()
        .create(true)
        .write(true)
        .truncate(true)
        .open(VISITS_PATH)
        .expect("Unable to open file");
    f.write_all(data.as_bytes()).expect("Unable to write to file");
}

pub fn current_visits() -> u32 {
    let mut visits: u32 = 0;
    if Path::new(VISITS_PATH).exists() {
        let data: String = fs::read_to_string(VISITS_PATH)
            .expect("Unable to read file");
        visits = data.parse().unwrap();
    }
    return visits;
}