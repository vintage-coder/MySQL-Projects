create database if not exists School;
use School;
create table school_id(id int auto_increment primary key, name varchar(50));

insert into school_id(name) values("CBSC"),("ICSC"),("Government");

select * from school_id;
