#[macro_use]
extern crate rocket;

use chrono::Local;
use currenttime::{visits::VisistsLogger, Settings};
use rocket::{tokio::sync::Mutex, State};
use rocket_dyn_templates::{context, Template};
use rocket_prometheus::PrometheusMetrics;

fn get_current_time(settings: &Settings) -> String {
    Local::now()
        .with_timezone(&settings.time_zone)
        .format(&settings.time_format)
        .to_string()
}

#[get("/")]
async fn index(visists: &State<Mutex<VisistsLogger>>, settings: &State<Settings>) -> Template {
    let time = get_current_time(settings);
    let res = visists.lock().await.write_visit(&time);
    if res.is_err() {
        println!("writing to visits error: {:?}", res.unwrap_err())
    }
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

#[get("/visits")]
async fn visists(visists: &State<Mutex<VisistsLogger>>) -> Result<String, std::io::Error> {
    visists.lock().await.get_visists()
}

#[launch]
fn rocket() -> _ {
    let settings = Settings::from_file("config.json").expect("config file not found");
    let visists_logger = VisistsLogger::new(&settings.visits_file_path).unwrap();
    let prometheus = PrometheusMetrics::new();

    rocket::build()
        .manage(settings)
        .manage(Mutex::new(visists_logger))
        .attach(prometheus.clone())
        .mount("/", routes![index, health, visists])
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
