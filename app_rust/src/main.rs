#[macro_use]
extern crate rocket;

use chrono::Local;
use currenttime::Settings;
use rocket::State;
use rocket_dyn_templates::{context, Template};
use rocket_prometheus::PrometheusMetrics;

fn get_current_time(settings: &Settings) -> String {
    Local::now()
        .with_timezone(&settings.time_zone)
        .format(&settings.time_format)
        .to_string()
}

#[get("/")]
fn index(settings: &State<Settings>) -> Template {
    let time = get_current_time(settings);
    Template::render(
        "index",
        context! {
            time,
        },
    )
}

#[get("/health")]
fn health() -> String {
    "OK".to_string()
}

#[launch]
fn rocket() -> _ {
    let settings = Settings::default();
    let prometheus = PrometheusMetrics::new();

    rocket::build()
        .manage(settings)
        .attach(prometheus.clone())
        .mount("/", routes![index, health])
        .mount("/metrics", prometheus)
        .attach(Template::fairing())
}

#[cfg(test)]
mod tests {
    use super::*;
    use rocket::{http::Status, local::blocking::Client};

    #[test]
    fn test_get_current_time() {
        let client = Client::tracked(rocket()).expect("valid rocket instance");
        let response = client.get("/").dispatch();
        assert_eq!(response.status(), Status::Ok);
        let body = response
            .into_string()
            .expect("failed to get string from response");
        assert!(body.contains("Hello from Rust app!"))
    }
}
