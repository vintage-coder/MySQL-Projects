-- --------------------------------Stored Functions-------------------------------


/* 
A stored function is a special kind stored program that returns a single value.
 Typically, you use stored functions to encapsulate common formulas or
 business rules that are reusable among SQL statements or stored programs.

Syntax:
DELIMITER $$

CREATE FUNCTION function_name(
    param1,
    param2,…
)
RETURNS datatype
[NOT] DETERMINISTIC
BEGIN
 -- statements
END $$

DELIMITER ;

   */

use classicmodels;

DELIMITER $$

CREATE FUNCTION CustomerLevel(
	credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit >= 50000 AND 
			credit <= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END$$
DELIMITER ;

show function status;   

SELECT 
    customerName, 
    CustomerLevel(creditLimit)
FROM
    customers
ORDER BY 
    customerName;
   
SHOW procedure status 
WHERE db = 'gowthaman';


DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  customerNo INT,  
    OUT customerLevel VARCHAR(20)
)
BEGIN

	DECLARE credit DEC(10,2) DEFAULT 0;
    
    -- get credit limit of a customer
    SELECT 
		creditLimit 
	INTO credit
    FROM customers
    WHERE 
		customerNumber = customerNo;
    
    -- call the function 
    SET customerLevel = CustomerLevel(credit);
END$$

DELIMITER ;


CALL GetCustomerLevel(-131,@customerLevel);
SELECT @customerLevel;


SHOW WARNINGS;

DELIMITER $$

CREATE FUNCTION OrderLeadTime (
    orderDate DATE,
    requiredDate DATE
) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN requiredDate - orderDate;
END$$

DELIMITER ;

show function status;
DROP FUNCTION OrderLeadTime;

DROP FUNCTION IF EXISTS NonExistingFunction;
SHOW WARNINGS;

show errors;

SHOW FUNCTION STATUS LIKE '%Customer%';

SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'FUNCTION'
        AND routine_schema = 'classicmodels';
        
SELECT 
    *
FROM
    information_schema.routines
WHERE
	routine_schema = 'classicmodels';



