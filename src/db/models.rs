use chrono::naive::NaiveDate;
use serde::Serialize;

use super::schema::posts;

#[derive(Insertable)]
#[table_name = "posts"]
pub struct NewPost<'a> {
    pub date: NaiveDate,
    pub title: &'a str,
    pub subtitle: &'a str,
    pub content: String,
}

#[derive(Serialize, Queryable)]
pub struct Post {
    pub id: i32,
    pub date: String,
    pub title: String,
    pub subtitle: String,
    pub content: String,
}
