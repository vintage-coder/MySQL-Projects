create database if not exists School;
use School;
create table school_id(id int auto_increment primary key, name varchar(50));

insert into school_id(name) values("CBSC"),("ICSC"),("Government");

select * from school_id;

select database();

select now();

explain select * from school_id;

CREATE DATABASE Students;

USE Students;

CREATE TABLE Information (firstname VARCHAR(20),lastname VARCHAR(20),gender CHAR(1),grade INT(10), dob DATE);

SHOW TABLES;

DESCRIBE Information;

INSERT INTO Information VALUES ('Amanda','Williams','f','10','1999-03-30');

INSERT INTO Information VALUES ('Peter','Williams','m','10','1998-03-15');

INSERT INTO Information VALUES ('Cristies','Willst','f','10','2010-02-22');

SELECT * FROM Information;




