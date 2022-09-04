use chrono::prelude::Utc;
use chrono_tz::Europe::Moscow;

fn get_time() -> String {
    let dt = Utc::now().with_timezone(&Moscow);
    format!("{}", dt.format("%+"))
}

#[macro_use]
extern crate rocket;

#[get("/")]
fn index() -> String {
    get_time()
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}

#[cfg(test)]
mod test {
    use super::rocket;
    use chrono::{DateTime, FixedOffset, Utc};
    use rocket::http::Status;
    use rocket::local::blocking::Client;

    #[test]
    fn index() {
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
