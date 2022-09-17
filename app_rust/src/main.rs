#[macro_use]
extern crate rocket;

use chrono::Local;
use currenttime::Settings;
use rocket::State;
use rocket_dyn_templates::{context, Template};

fn get_current_time(settings: &Settings) -> String {
    Local::now()
        .with_timezone(&settings.time_zone)
        .format(&settings.time_format)
        .to_string()
}

#[get("/")]
fn index(settings: &State<Settings>) -> Template {
    let time = get_current_time(&settings);
    Template::render(
        "index",
        context! {
            time,
        },
    )
}

#[launch]
fn rocket() -> _ {
    let settings = Settings::default();

    rocket::build()
        .manage(settings)
        .mount("/", routes![index])
        .attach(Template::fairing())
}
