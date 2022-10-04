use chrono::{DateTime, FixedOffset, Local};
use rocket::{get, launch, routes};

fn get_time_moscow() -> DateTime<FixedOffset> {
    let hour = 3600;
    Local::now().with_timezone(&FixedOffset::east(3 * hour))
}

fn render_time_page(timezone_name: &str, time: DateTime<FixedOffset>) -> String {
    format!("{} time: {}", timezone_name, time.format("%H:%M:%S"))
}

#[get("/")]
fn index() -> String {
    render_time_page("Moscow", get_time_moscow())
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}

#[cfg(test)]
mod tests {
    use super::*;
    use rocket::{http::Status, local::blocking::Client};

    #[test]
    fn it_responds() {
        // Setting up
        let rocket = rocket::build().mount("/", routes![index]);
        let client = Client::tracked(rocket).unwrap();
        let req = client.get("/");

        let response = req.dispatch();
        assert_eq!(response.status(), Status::Ok);
    }

    fn prepare_test_cases<'a, 'b, I>(inputs: I) -> Vec<(DateTime<FixedOffset>, &'a str, String)>
    where
        I: Iterator<Item = (&'b str, &'a str)>,
    {
        inputs
            .into_iter()
            .map(|(time, tz_name)| {
                let dt = DateTime::parse_from_str(time, "%Y %b %d %H:%M:%S%.3f %z")
                    .expect("Should parse");
                let time_only_string = dt.format("%H:%M:%S").to_string();
                (dt, tz_name, time_only_string)
            })
            .collect()
    }

    #[test]
    fn it_renders_correctly() {
        let inputs = vec![
            ("2022 Sep 18 18:22:00.000 +0003", "Moscow"),
            ("1983 Apr 13 12:09:14.274 +0000", "Moscow"),
            ("2121 Apr 13 00:09:14.274 +0001", "Moscow"),
            ("2022 Apr 13 00:09:14.274 +0001", "Aboba"),
            ("0000 Feb 29 00:00:00.000 +0000", "Berlin"),
        ];
        let cases = prepare_test_cases(inputs.into_iter());
        for (dt, tz_name, expected_time_string) in cases {
            let render = render_time_page(tz_name, dt);
            assert!(render.contains(tz_name));
            assert!(render.contains(expected_time_string.as_str()));
        }
    }
}
