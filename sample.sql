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


create database Committe;

use Committe;

create table profile1 (id int auto_increment primary key, first_name varchar(30),last_name varchar(30)); 

insert into profile1 (first_name,last_name) values("Albert","einstein");

select * from profile1;

-- classicmodels examples execution commands in the mysql tutorial
use classicmodels;

show tables;

-- ------------------------------------inner join ------
 
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;
    
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);
-- -----------------------------------Group by is used mostly with aggregation function in select clause ----------------------------------
SELECT 
    status
FROM
    orders
GROUP BY status;

SELECT DISTINCT
    status
FROM
    orders;
    
SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;

SELECT 
    status, 
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
GROUP BY 
    status;
    
    SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    YEAR(orderDate);
    
    
    SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    year
HAVING 
    year > 2003;
    
SELECT 
    status , 
    COUNT(*)
FROM
    orders
GROUP BY 
    status ;

-- generally distinct won't sort results set , so using order by we can achive sorting
SELECT DISTINCT
    state
FROM
    customers
ORDER BY 
    state;


SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;


SELECT 
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY 
    orderNumber;


SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber;

-- ---------------------------Having clause is used after group by operations to filter based on condition
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY 
   ordernumber
HAVING 
   total > 60000;

SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING 
    total > 1000 AND 
    itemsCount > 600;
    
    
    SELECT 
    a.ordernumber, 
    status, 
    SUM(priceeach*quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b 
    ON b.ordernumber = a.ordernumber
GROUP BY  
    ordernumber, 
    status
HAVING 
    status = 'Shipped' AND 
    total > 1500;
    
