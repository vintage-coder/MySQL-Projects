
-- --------------------------stored procedures-------------------
/* If you want to save this query on the database server for execution later, 
one way to do it is to use a stored procedure. 

MySQL stored procedure advantages
1. Reduce Network Traffic
instead of sending multiple lengthy SQL statements, 
applications have to send only the name and parameters of stored procedures.
2. Centralize business logic in the database
The stored procedures help reduce the efforts of duplicating 
the same logic in many applications and make your database more consistent.

MySQL stored procedure disadvantages
1. Resource Usage
2. Trouble shooting
3. Maintenances

*/


use classicmodels;

DELIMITER $$

CREATE PROCEDURE GetCustomers()
BEGIN
	SELECT 
		customerName, 
		city, 
		state, 
		postalCode, 
		country
	FROM
		customers
	ORDER BY customerName;    
END$$
DELIMITER ;

-- ------------------ to list the available store procedure--------
SHOW PROCEDURE status;

-- ------------------to view the definition of stored procedure---------

SHOW create PROCEDURE GetCustomers;

SELECT ROUTINE_DEFINITION FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_SCHEMA = 'classicmodels' AND ROUTINE_TYPE = 'PROCEDURE' AND ROUTINE_NAME = "GetCustomers";


select * from INFORMATION_SCHEMA.ROUTINES;

CALL GetCustomers();
-- ---can't execute other databased stored procedure in the current database

call GetAllCustomers();








