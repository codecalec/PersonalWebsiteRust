use crate::db::models::NewPost;

use chrono::naive::NaiveDate;
use chrono::offset::Local;
use std::path::Path;

fn convert_markdown(md: String) -> String {
    return md;
}

fn convert_file(content_file: &Path) -> String {
    return convert_markdown("test".to_string());
}

fn generate_post<'a>(
    title: &'a str,
    subtitle: &'a str,
    date: Option<NaiveDate>,
    content_file: &Path,
) -> NewPost<'a> {
    let date = match date {
        Some(d) => d,
        None => Local::today().naive_local(),
    };
    let html_content = convert_file(content_file);
    let post = NewPost {
        date,
        title,
        subtitle,
        content: html_content,
    };

    return post;
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn check_basic_markdown() {
        let input = String::from("Hello, **世界**!");
        assert_eq!(
            convert_markdown(input),
            "<p>Hello, <strong>世界</strong>!</p>\n"
        );
    }

    #[test]
    fn create_post_without_date() {
        assert!(1 == 1);
    }
}
