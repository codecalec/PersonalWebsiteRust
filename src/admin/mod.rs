mod post_handling;

use std::path::Path;

use crate::db::schema::posts::dsl::posts;
use diesel::prelude::*;
use chrono::NaiveDate;


pub struct PostInfo<'a> {
    pub title: &'a str,
    pub subtitle: &'a str,
    pub date: Option<NaiveDate>,
    pub content_file: &'a Path, 
}

pub fn add_post(
    post_info: PostInfo,
    conn: SqliteConnection,
) -> QueryResult<usize> {
    let post = post_handling::generate_post(post_info);
    diesel::insert_into(posts).values(&post).execute(&conn)
}
