#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

#[macro_use]
extern crate diesel;

extern crate dotenv;

mod db;

use db::models::Post;

use rocket::http::RawStr;
use rocket::Request;

use rocket_contrib::serve::StaticFiles;
use rocket_contrib::templates::Template;

use serde::Serialize;

#[derive(Serialize)]
enum NavbarOption {
    Home,
    Blog,
    Resume,
}

/// Defines routing for landing page at `/`
#[get("/")]
fn index() -> Template {

    #[derive(Serialize)]
    struct HomeContext {
        navbar_status: NavbarOption,
    }

    let context = HomeContext {
        navbar_status: NavbarOption::Home,
    };
    Template::render("home", context)
}

/// Defines routing for blog page at `/blog`
#[get("/blog")]
fn blog() -> Template {
    #[derive(Serialize)]
    struct PostListContext {
        navbar_status: NavbarOption,
        posts: Vec<Post>,
    }

    let posts = db::get_posts();
    let context = PostListContext{
        navbar_status: NavbarOption::Blog,
        posts: posts
    };
    Template::render("blog", context)
}

#[get("/blog?<id>")]
fn blog_id(id: &RawStr) -> Template {
    #[derive(Serialize)]
    struct PostContext {
        navbar_status: NavbarOption,
        post: Post,
    }
    let id = id.url_decode().unwrap().parse::<i32>().unwrap();
    let post = db::get_post_by_id(id).expect("Could not find id in db");
    let context = PostContext{
        navbar_status: NavbarOption::Blog,
        post: post,
    };
    Template::render("post", context)
}

#[get("/resume")]
fn resume() -> Template {
    #[derive(Serialize)]
    struct ResumeContext {
        navbar_status: NavbarOption,
    }

    let context = ResumeContext {
        navbar_status: NavbarOption::Resume,
    };
    Template::render("resume_content", context)
}

#[catch(404)]
fn not_found(req: &Request) -> String {
    format!("Not Found: {}", req)
}

fn main() {
    rocket::ignite()
        .register(catchers![not_found])
        .mount("/", routes![index, blog, blog_id, resume])
        .mount("/static", StaticFiles::from("static"))
        .attach(Template::fairing())
        .launch();
}
