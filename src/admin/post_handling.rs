use crate::db::models::NewPost;

use chrono::offset::Local;
use comrak::{markdown_to_html, ComrakOptions};

use std::fs::File;
use std::io::Read;
use std::path::Path;

use super::PostInfo;

fn convert_markdown(md: String) -> String {
    return markdown_to_html(&md, &ComrakOptions::default());
}

fn convert_file(content_file: &Path) -> std::io::Result<String> {
    let mut file = File::open(content_file)?;
    let mut content = String::new();
    file.read_to_string(&mut content)?;
    return Ok(convert_markdown(content));
}

pub fn generate_post<'a>(
    post_info: PostInfo<'a>
) -> NewPost<'a> {
    let date = match post_info.date {
        Some(d) => d,
        None => Local::today().naive_local(),
    };

    let html_content = match convert_file(post_info.content_file) {
        Ok(content) => content,
        Err(e) => panic!("error: {:?}", e),
    };

    let post = NewPost {
        date,
        title: post_info.title,
        subtitle: post_info.subtitle,
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
