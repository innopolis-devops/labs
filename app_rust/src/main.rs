use chrono::Duration;
use log::{FileLog, Log};
use rocket::{
    futures::lock::Mutex, get, http::Status, launch, routes, tokio::fs::OpenOptions, State,
};
use rocket_prometheus::PrometheusMetrics;

use serde::{de::DeserializeOwned, Serialize};
use utils::{
    get_local_time_moscow, get_remote_time_moscow, render_time_page, render_visits_page,
    TimeRequestError,
};

mod config;
mod log;
mod utils;

// Created because Rocket does not seem to support generics
// for handlers.
// https://github.com/SergioBenitez/Rocket/issues/408#issuecomment-1167912779
enum LogChoice<T> {
    File(FileLog<T>),
    Mock(log::Mock<T>),
}

impl<T> From<log::Mock<T>> for LogChoice<T> {
    fn from(l: log::Mock<T>) -> Self {
        LogChoice::Mock(l)
    }
}

impl<T> From<FileLog<T>> for LogChoice<T> {
    fn from(l: FileLog<T>) -> Self {
        LogChoice::File(l)
    }
}

#[async_trait::async_trait]
impl<TEntry> Log<TEntry> for LogChoice<TEntry>
where
    TEntry: Serialize + DeserializeOwned + Clone + Send + Sync,
{
    async fn push(&mut self, entry: TEntry) -> log::Result<()> {
        match self {
            LogChoice::File(f) => f.push(entry).await,
            LogChoice::Mock(m) => m.push(entry).await,
        }
    }

    async fn as_vec(&mut self) -> log::Result<Vec<TEntry>> {
        match self {
            LogChoice::File(f) => f.as_vec().await,
            LogChoice::Mock(m) => m.as_vec().await,
        }
    }
    async fn len(&mut self) -> log::Result<usize> {
        match self {
            LogChoice::File(f) => f.len().await,
            LogChoice::Mock(m) => m.len().await,
        }
    }
}

#[get("/")]
async fn index(state: &State<Mutex<LogChoice<String>>>) -> String {
    let time = get_local_time_moscow();
    {
        let mut state_locked = state.lock().await;
        if let Err(e) = state_locked.push(time.format("%H:%M:%S").to_string()).await {
            println!("WARN: Could not push to visitors list, {:?}", e);
        }
    }
    render_time_page("Moscow", time)
}

#[get("/visits")]
async fn visits(state: &State<Mutex<LogChoice<String>>>) -> (Status, String) {
    let list = {
        let mut state_locked = state.lock().await;
        match state_locked.as_vec().await {
            Ok(l) => l,
            Err(e) => {
                println!("WARN: Could not read visitors list, {:?}", e);
                return (
                    Status::InternalServerError,
                    "InternalServerError".to_owned(),
                );
            }
        }
    };
    (Status::Ok, render_visits_page(list))
}

#[get("/status")]
async fn status_check() -> (Status, String) {
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
            return (Status::ServiceUnavailable, output);
        }
    };
    let local_time = get_local_time_moscow();
    let diff = remote_time - local_time;
    if diff.num_seconds().abs() < max_allowed_diff_secs {
        (
            Status::Ok,
            format!(
                "Local time is correct. Error ({}) is within boundary ({})",
                diff,
                Duration::seconds(max_allowed_diff_secs)
            ),
        )
    } else {
        (
            Status::Ok,
            format!(
                "Local time is incorrect. Difference with another time provider is {}",
                diff
            ),
        )
    }
}

#[launch]
async fn rocket() -> _ {
    let prometheus = PrometheusMetrics::new();
    let config = config::Config::read_from_file_path("config.json")
        .await
        .unwrap_or_default();
    let file = OpenOptions::new()
        .read(true)
        .write(true)
        .create(true)
        .open(config.visits_file_path)
        .await
        .unwrap();
    let log: LogChoice<_> = FileLog::<String>::new(file)
        .await
        .expect("Could not open visits file")
        .into();
    // let log: LogChoice<_> = log::Mock::<String>::new().into();
    rocket::build()
        .manage(Mutex::new(log))
        .attach(prometheus.clone())
        .mount("/", routes![index, status_check, visits])
        .mount("/metrics", prometheus)
}

#[cfg(test)]
mod tests {
    use super::*;
    use rocket::{http::Status, local::blocking::Client};

    #[test]
    fn it_responds() {
        // Setting up
        let mock_log: LogChoice<_> = log::Mock::<String>::new().into();
        let rocket = rocket::build()
            .manage(Mutex::new(mock_log))
            .mount("/", routes![index]);
        let client = Client::tracked(rocket).unwrap();
        let req = client.get("/");

        let response = req.dispatch();
        assert_eq!(response.status(), Status::Ok);
    }
}
