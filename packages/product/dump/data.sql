CREATE DATABASE products;

USE products;

CREATE TABLE product (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO product (name) VALUES ('CalDigit Tuff Nano');