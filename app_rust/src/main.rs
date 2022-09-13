use chrono::{DateTime, FixedOffset, Local};
use rocket::{get, launch, routes};

fn get_time_moscow() -> DateTime<FixedOffset> {
    let hour = 3600;
    Local::now().with_timezone(&FixedOffset::east(3 * hour))
}

#[get("/")]
fn index() -> String {
    format!("Moscow time: {}", get_time_moscow().format("%H:%M:%S"))
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}
