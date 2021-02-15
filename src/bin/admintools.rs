extern crate clap;
extern crate personal_website_rust;
extern crate chrono;

use std::path::Path;

use personal_website_rust::{admin, db};
use personal_website_rust::admin::PostInfo;

use clap::{App, Arg, ArgMatches, SubCommand};
use chrono::NaiveDate;

fn main() {
    let matches = App::new("Admin Tools")
        .subcommand(
            SubCommand::with_name("add")
                .arg(
                    Arg::with_name("title")
                        .short("t")
                        .value_name("TITLE")
                        .takes_value(true)
                        .required(true),
                )
                .arg(
                    Arg::with_name("subtitle")
                        .short("s")
                        .value_name("SUBTITLE")
                        .takes_value(true)
                        .required(true),
                )
                .arg(
                    Arg::with_name("date")
                        .short("d")
                        .value_name("DATE")
                        .takes_value(true),
                )
                .arg(
                    Arg::with_name("file")
                        .short("f")
                        .value_name("FILE")
                        .takes_value(true)
                        .required(true),
                ),
        )
        .get_matches();

    if let Some(matches) = matches.subcommand_matches("add") {
        add_post(matches);
    }
}

fn read_arg_matches_add<'a>(matches: &'a ArgMatches) -> PostInfo<'a> {
    let title = matches.value_of("title").expect("Error reading title");
    let subtitle = matches
        .value_of("subtitle")
        .expect("Error reading subtitle");
    let date = if matches.is_present("date") {
        Some(
            NaiveDate::parse_from_str(matches.value_of("date").expect("Error finding date arg"), "%Y-%m-%d")
                .expect("Error parsing date"),
        )
    } else {
        None
    };
    let content_file = &Path::new(matches.value_of("file").expect("Error reading file path"));

    return PostInfo {
        title,
        subtitle,
        date,
        content_file,
    };
}

fn add_post(matches: &ArgMatches<'_>) {
    let post_info = read_arg_matches_add(matches);
    let connection = db::establish_connection();

    admin::add_post(post_info, connection).expect("Error inserting into db");
}
