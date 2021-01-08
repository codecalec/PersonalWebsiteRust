PRAGMA foreign_keys = ON;

CREATE TABLE posts (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    date DATE NOT NULL,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(1024) NOT NULL,
    content TEXT NOT NULL
);

CREATE TABLE pages (
    page_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(32) NOT NULL
);

INSERT INTO pages (name) VALUES ("Home");
INSERT INTO pages (name) VALUES ("Blog");
INSERT INTO pages (name) VALUES ("Resume");

CREATE TABLE texts (
    text_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    page INTEGER NOT NULL,
    description VARCHAR(64) NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY(page) REFERENCES pages(page_id)
);
