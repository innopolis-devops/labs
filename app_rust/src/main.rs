use std::fs::{self, File};
use std::io::prelude::*;

use chrono::prelude::Utc;
use chrono_tz::Europe::Moscow;
use rocket_prometheus::PrometheusMetrics;

fn get_time() -> String {
    let dt = Utc::now().with_timezone(&Moscow);
    format!("{}", dt.format("%+"))
}

#[macro_use]
extern crate rocket;

#[rocket::get("/")]
fn index() -> String {
    let mut visits: i32;
    if let Ok(mut file) = File::open("volume/visits") {
        let mut content = String::new();
        file.read_to_string(&mut content).unwrap();
        visits = content.parse::<i32>().unwrap();
    } else {
        visits = 0;
    }

    if let Ok(mut file) = File::create("volume/visits") {
        visits += 1;
        file.write_all(visits.to_string().as_bytes()).unwrap();
    }

    get_time()
}

#[rocket::get("/visits")]
fn visits() -> String {
    if let Ok(mut file) = File::open("volume/visits") {
        let mut content = String::new();
        file.read_to_string(&mut content).unwrap();
        content
    } else {
        "0".to_string()
    }
}

#[rocket::get("/healthcheck")]
fn healthcheck() -> String {
    "ඞ".to_string()
}

#[rocket::launch]
fn rocket() -> _ {
    fs::create_dir("./volume").ok();

    let prometheus = PrometheusMetrics::new();
    rocket::build()
        .attach(prometheus.clone())
        .mount("/metrics", prometheus)
        .mount("/", routes![index, healthcheck, visits])
}

#[cfg(test)]
mod test {
    use std::fs;

    use super::rocket;
    use chrono::{DateTime, FixedOffset, Utc};
    use rocket::http::Status;
    use rocket::local::blocking::Client;

    #[test]
    fn index() {
        fs::create_dir("./volume").ok();

        let client = Client::tracked(rocket()).expect("valid rocket instance");
        let response = client.get("/").dispatch();

        assert_eq!(response.status(), Status::Ok);
        let dt = DateTime::<FixedOffset>::parse_from_rfc3339(&response.into_string().unwrap())
            .unwrap()
            .with_timezone(&Utc);
        let delta = chrono::Utc::now() - dt;
        assert!(delta.num_seconds() < 60);
    }
}
