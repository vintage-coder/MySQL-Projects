
-- ------------------------------------Triggers 
/*
a trigger is a stored program invoked automatically in response to an event
 such as insert, update, or delete that occurs in the associated table.
 
 SQL standard defines two levels of triggers: low-level triggers and statement level triggers.
 MySQL supports only low level triggers.
 
 MySQL triggers:
 1. Before insert
 2. After insert
 3. Before update
 4. After update
 5. Before delete
 6. After delete
 
Pros
Triggers are useful for running schduled task. we dont need to wait for scheduled events because it automatically invoked internally.
 
Cons
Triggers can only provide extended validations, not all validations. 
For simple validations, you can use the NOT NULL, UNIQUE, CHECK and FOREIGN KEY constraints.
Triggers can be difficult to troubleshoot because they execute automatically in the database, which may not invisible to the client applications.
 
 Syntax:
 CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name FOR EACH ROW
trigger_body;
 
  */
  
use classicmodels;

show tables;
select * from  employees_audit;
CREATE TABLE if not exists employees_audit (id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

show triggers;
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();
     


UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;


select * from employees_audit;

select employeeNumber,lastname from employees where employeeNumber=1056;

UPDATE employees 
SET 
    lastName = 'God Vishnu'
WHERE
    employeeNumber = 1056;
    
-- -----------Drop Trigger---------------------------------------------------

CREATE TABLE billings (
    billingNo INT AUTO_INCREMENT,
    customerNo INT,
    billingDate DATE,
    amount DEC(10 , 2 ),
    PRIMARY KEY (billingNo)
);


DELIMITER $$
CREATE TRIGGER before_billing_update
    BEFORE UPDATE 
    ON billings FOR EACH ROW
BEGIN
    IF new.amount > old.amount * 10 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'New amount cannot be 10 times greater than the current amount.';
    END IF;
END$$    
DELIMITER ;

show triggers;

DROP TRIGGER before_billing_update;


-- ---------------------Before insert triggers--------------------------

DROP TABLE IF EXISTS WorkCenters;

CREATE TABLE WorkCenters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

DROP TABLE IF EXISTS WorkCenterStats;

CREATE TABLE WorkCenterStats(
    totalCapacity INT NOT NULL
);

DELIMITER $$

CREATE TRIGGER before_workcenters_insert
BEFORE INSERT
ON WorkCenters FOR EACH ROW
BEGIN
    DECLARE rowcount INT;
    
    SELECT COUNT(*) 
    INTO rowcount
    FROM WorkCenterStats;
    
    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
    END IF; 

END $$

DELIMITER ;

show triggers;

INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine',100);

SELECT * FROM WorkCenterStats;    
INSERT INTO WorkCenters(name, capacity) VALUES('Packing',200);

-- -------------------After insert --------------------------------------------------

















