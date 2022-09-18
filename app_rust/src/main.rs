use chrono::{DateTime, FixedOffset, Local};
use rocket::{get, launch, routes};

fn get_time_moscow() -> DateTime<FixedOffset> {
    let hour = 3600;
    Local::now().with_timezone(&FixedOffset::east(3 * hour))
}

fn render_time_page(timezone_name: String, time: DateTime<FixedOffset>) -> String {
    format!("{} time: {}", timezone_name, time.format("%H:%M:%S"))
}

#[get("/")]
fn index() -> String {
    render_time_page("Moscow".to_owned(), get_time_moscow())
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}


#[cfg(test)]
mod tests {
    use rocket::{local::blocking::Client, http::Status};
    use super::*;

    #[test]
    fn it_responds() {
        let rocket = rocket::build().mount("/", routes![index]);
        let client = Client::tracked(rocket).unwrap();
        let req = client.get("/");        
        let response = req.dispatch();
        assert_eq!(response.status(), Status::Ok);
    }

    #[test]
    fn it_renders_correctly() {
        let dt = DateTime::parse_from_str("1983 Apr 13 12:09:14.274 +0000", "%Y %b %d %H:%M:%S%.3f %z").expect("Should parse");
        let render = render_time_page("Aboba".to_owned(), dt);
        assert!(render.contains("Aboba"));
        assert!(render.contains("12:09:14"));
    }
}
