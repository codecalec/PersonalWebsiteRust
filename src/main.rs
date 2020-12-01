#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket::http::RawStr;
use rocket::Request;

use rocket_contrib::templates::Template;
use rocket_contrib::serve::StaticFiles;

use serde::Serialize;

#[derive(Serialize)]
enum NavbarOption {
    Home,
    Blog,
    Resume,
}


#[derive(Serialize)]
struct Context {
    navbar_status: NavbarOption,
}


#[get("/")]
fn index() -> Template {
    let context = Context {
        navbar_status: NavbarOption::Home,
    };
    let serialized = serde_json::to_string(&context).unwrap();
    println!("home context serialized: {}", serialized);
    Template::render("home", context)
}

#[get("/blog")]
fn blog() -> &'static str {
    "blog"
}

#[get("/blog?<id>")]
fn blog_id(id: &RawStr) -> String {
    format!("blog entry {}", id.as_str())
}

#[get("/resume")]
fn resume() -> &'static str {
    "resume"
}

#[catch(404)]
fn not_found(req: &Request) -> String {
    format!("Page Not Found at '{}'", req.uri())
}

fn main() {
    rocket::ignite()
        .register(catchers![not_found])
        .mount("/", routes![index, blog, blog_id, resume])
        .mount("/static", StaticFiles::from("static"))
        .attach(Template::fairing())
        .launch();
}
