
--  ---------------------------views & indexes----------------------------------

/* A better way to do this is to save the query in the database server and assign a name to it. 
This named query is called a database view, or simply, view. 

Note that a view does not physically store the data.
 When you issue the SELECT statement against the view,
 MySQL executes the underlying query specified in the view’s definition and returns the result set.
 For this reason, sometimes, a view is referred to as a virtual table.

Advantages of MySQL Views,
1. simplify complex query
2. make the business logic consistent
3. Add extra security layers
4. Enable backward compatibility


 */

use classicmodels;

CREATE VIEW customerPayments
AS 
SELECT 
    customerName, 
    checkNumber, 
    paymentDate, 
    amount
FROM
    customers
INNER JOIN
    payments USING (customerNumber);


SELECT * FROM customerPayments;

SHOW FULL TABLES 
WHERE table_type = 'VIEW';

show full tables where table_type='BASE TABLE';

SHOW FULL TABLES
FROM  employeedb
WHERE table_type = 'BASE TABLE';

SHOW FULL TABLES
IN  classicmodels
WHERE table_type = 'VIEW';

SHOW FULL TABLES IN sys 
WHERE table_type='VIEW';


SHOW FULL TABLES 
FROM sys
LIKE 'waits%';

SELECT * 
FROM information_schema.tables;

SELECT 
    table_name view_name
FROM 
    information_schema.tables 
WHERE 
    table_type   = 'VIEW' AND 
    table_schema = 'classicmodels';

SELECT 
    table_name view_name
FROM 
    information_schema.tables 
WHERE 
    table_type   = 'VIEW' AND 
    table_schema = 'classicmodels' AND
    table_name   LIKE 'customer%';






























-- -------------------------------Indexes-----------------------------------

/* MySQL uses indexes to quickly find rows with specific column values.
 Without an index, MySQL must scan the whole table to locate the relevant rows. 
The larger table, the slower it searches. */

use classicmodels;
SHOW INDEXES FROM employees;


explain select 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';
    
    
CREATE INDEX jobTitle ON employees(jobTitle);

explain select 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    jobTitle = 'Sales Rep';
    