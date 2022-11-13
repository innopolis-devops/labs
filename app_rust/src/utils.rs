use std::collections::HashMap;

use chrono::{DateTime, FixedOffset, Local};
use serde::{self, Deserialize, Serialize};
use thiserror::Error;

pub fn get_local_time_moscow() -> DateTime<FixedOffset> {
    let hour = 3600;
    Local::now().with_timezone(&FixedOffset::east(3 * hour))
}

pub fn render_time_page(timezone_name: &str, time: DateTime<FixedOffset>) -> String {
    format!("{} time: {}", timezone_name, time.format("%H:%M:%S"))
}

#[derive(Error, Debug)]
pub enum ParseError {
    #[error("required field \"{0}\" was not found")]
    NoRequiredField(String),
    #[error("incorrect value: {0}")]
    IncorrectValue(String),
    #[error("incorrect time format: {0:?}")]
    IncorrectTimeFmt(#[from] chrono::ParseError),
}

#[derive(Error, Debug)]
pub enum TimeRequestError {
    #[error("failure when making a query or getting a response")]
    RequestFailure(#[from] reqwest::Error),
    #[error("couldn't parse the response")]
    InvalidResponse(#[from] ParseError),
}

fn parse_response(
    response: HashMap<String, JsonFieldPayload>,
) -> Result<DateTime<FixedOffset>, TimeRequestError> {
    let time = response
        .get("datetime")
        .ok_or_else(|| ParseError::NoRequiredField("field \"datetime\" not found".to_owned()))?;
    let time = match time {
        JsonFieldPayload::String(s) => s,
        v => return Err(ParseError::IncorrectValue(format!("{:?}", v)).into()),
    };
    DateTime::parse_from_rfc3339(time)
        .map_err(Into::<ParseError>::into)
        .map_err(Into::into)
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(untagged)]
enum JsonFieldPayload {
    String(String),
    Number(i64),
    Bool(bool),
    Nothing,
}

pub async fn get_remote_time_moscow() -> Result<DateTime<FixedOffset>, TimeRequestError> {
    let resp = reqwest::get("http://worldtimeapi.org/api/timezone/Europe/Moscow")
        .await?
        .json::<HashMap<String, JsonFieldPayload>>()
        .await?;
    parse_response(resp)
}

#[cfg(test)]
mod tests {
    use super::*;

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
