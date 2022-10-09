#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
use rocket::response::content::Html;

#[macro_use]
extern crate rocket_prometheus;
use rocket_prometheus::PrometheusMetrics;

#[macro_use]
extern crate chrono;

#[macro_use]
extern crate assert_matches;

mod utils;

#[get("/")]
fn index() -> Html<String> {
    let utc_now = chrono::Utc::now();
    let msc_now = utc_now
        .with_timezone(
            &chrono::FixedOffset::east(utils::MSC_TZ_OFFSET))
        .to_rfc3339();

    Html(format!("<h1>{}</h1>", msc_now))
}

#[get("/health")]
fn health() -> Html<&'static str> {
    Html("Ok")
}

fn rocket() -> rocket::Rocket {
    let prometheus = PrometheusMetrics::new();
    rocket::ignite()
        .attach(prometheus.clone())
        .mount("/metrics", prometheus)
        .mount("/", routes![index, health])
}

fn main() {
    rocket().launch();
}

#[cfg(test)]
mod test {
    use super::rocket;
    use rocket::local::Client;
    use rocket::http::Status;

    #[test]
    fn index() {
        let client = Client::new(rocket()).expect("valid rocket instance");
        let mut response = client.get("/").dispatch();
        assert_eq!(response.status(), Status::Ok);
        assert_matches!(response.body_string(), Some(_));
    }

    #[test]
    fn health() {
        let client = Client::new(rocket()).expect("valid rocket instance");
        let mut response = client.get("/health").dispatch();
        assert_eq!(response.status(), Status::Ok);
    }
}