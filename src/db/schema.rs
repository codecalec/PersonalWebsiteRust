table! {
    pages (page_id) {
        page_id -> Integer,
        name -> Text,
    }
}

table! {
    posts (id) {
        id -> Integer,
        date -> Date,
        title -> Text,
        subtitle -> Text,
        content -> Text,
    }
}

table! {
    texts (text_id) {
        text_id -> Integer,
        page -> Integer,
        description -> Text,
        content -> Text,
    }
}

joinable!(texts -> pages (page));

allow_tables_to_appear_in_same_query!(
    pages,
    posts,
    texts,
);
