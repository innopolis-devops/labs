#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;
use rocket::response::content::Html;

#[macro_use]
extern crate chrono;

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

fn main() {
    rocket::ignite().mount("/", routes![index]).launch();
}