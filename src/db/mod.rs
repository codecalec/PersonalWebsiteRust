pub mod models;
pub mod schema;

use diesel::prelude::*;
use diesel::sqlite::SqliteConnection;
use dotenv::dotenv;
use std::env;

use models::Post;

pub fn establish_connection() -> SqliteConnection {
    dotenv().ok();
    let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    SqliteConnection::establish(&database_url)
        .unwrap_or_else(|_| panic!("Error connecting to {}", database_url))
}

pub fn get_posts() -> Vec<Post> {
    use schema::posts::dsl::posts;
    let connection = establish_connection();
    posts
        .load::<Post>(&connection)
        .expect("Error loading posts")
}

pub fn get_post_by_id(id: i32) -> Result<Post, diesel::result::Error> {
    use schema::posts::dsl::posts;
    let connection = establish_connection();
    posts.find(id).first(&connection)
}

pub fn get_text_by_description(desc:&str) -> Result<String, diesel::result::Error> {
    use schema::texts::dsl::{texts, description, content};
    let connection = establish_connection();
    texts.filter(description.eq(desc))
        .select(content)
        .first::<String>(&connection)
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn check_if_connection_established() {
        dotenv().ok();
        establish_connection();
    }

    #[test]
    fn list_posts_in_posts() {
        let results = get_posts();
        for post in results {
            println!(
                "Date: {}\nTitle: {}\nSubtitle: {} Content: {}",
                post.date, post.title, post.subtitle, post.content
            );
        }
    }
}
