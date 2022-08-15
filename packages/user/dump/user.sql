CREATE DATABASE users;

USE users;

CREATE TABLE user (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    last_name varchar(255) NOT NULL,
    first_name varchar(255),
    age int
);

INSERT INTO user (last_name, first_name, age) VALUES ('okiebisu', 'ken', 24);