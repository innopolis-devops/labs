use chrono::Duration;
use rocket::{get, launch, routes};
use rocket_prometheus::PrometheusMetrics;

use utils::{get_local_time_moscow, get_remote_time_moscow, render_time_page, TimeRequestError};

mod utils;

#[get("/")]
fn index() -> String {
    render_time_page("Moscow", get_local_time_moscow())
}

#[get("/status")]
async fn status_check() -> String {
    let max_allowed_diff_secs = 5;

    let remote_time = match get_remote_time_moscow().await {
        Ok(t) => t,
        Err(e) => {
            // Rocket does not work properly with logging yet
            println!("WARN: {:?}", e);
            let err_cause_return = match e {
                TimeRequestError::RequestFailure(_) => "could not reach remote time server",
                TimeRequestError::InvalidResponse(_) => {
                    "remote time server returned invalid response"
                }
            };
            let mut output = "Failed to perform time status check: ".to_owned();
            output.push_str(err_cause_return);
            return output;
        }
    };
    let local_time = get_local_time_moscow();
    let diff = remote_time - local_time;
    if diff.num_seconds().abs() < max_allowed_diff_secs {
        format!(
            "Local time is correct. Error ({}) is within boundary ({})",
            diff,
            Duration::seconds(max_allowed_diff_secs)
        )
    } else {
        format!(
            "Local time is incorrect. Difference with another time provider is {}",
            diff
        )
    }
}

#[launch]
fn rocket() -> _ {
    let prometheus = PrometheusMetrics::new();
    rocket::build()
        .attach(prometheus.clone())
        .mount("/", routes![index, status_check])
        .mount("/metrics", prometheus)
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
}
