use serde::Serialize;

#[derive(Serialize, Queryable)]
pub struct Post {
    pub id: i32,
    pub date: String,
    pub title: String,
    pub subtitle: String,
    pub content: String,
}
