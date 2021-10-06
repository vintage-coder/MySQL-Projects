-- -------------------Database Administration---------------------------------------
/*  Database Administration
server startup and shutdown, user security, database maintenance, and backup &  restore.




 */

-- -----------------------------------User Management--------------------------------------

CREATE USER IF NOT EXISTS `gowthaman`@`localhost`
IDENTIFIED BY 'gowthaman@123';

drop user gowthaman@localhost;

create user api@localhost, remote, dbadmin@localhost, alice@localhost identified by 'Secure1Pass!';

create user 'welcome'@'%' identified by 'Welcome@123';

drop user dbadmin@localhost;

drop user if exists api@localhost, remote;


create database people;
use people;
 create table persons(id int auto_increment,
firstName varchar(100) not null,
lastName varchar(100) not null,
 primary key(id));

grant all privileges on people.* to gowthaman@localhost;

show processlist;

show databases;

SHOW DATABASES LIKE '%schema';

SELECT schema_name 
FROM information_schema.schemata;

show full tables;

use classicmodels;
CREATE VIEW contacts 
AS 
SELECT lastName, firstName, extension as phone 
FROM employees 
UNION
SELECT contactFirstName, contactLastName, phone 
FROM customers;

show full tables where table_type="VIEW";

show full tables;






-- ---------------------mysql schema default database practice------------------
use mysql;
show tables;

SHOW TABLES FROM mysql LIKE 'time%';
SHOW TABLES IN mysql LIKE 'time%';



select * from mysql.user;
select * from mysql.db;
-- ------------------information schema default database practice------------------------
use information_schema;

show tables;

select * from information_schema.views;

select * from information_schema.files;

select * from information_schema.events;

select * from information_schema.engines;

select * from information_schema.INNODB_TABLES;

/* ADMINISTRABLE_ROLE_AUTHORIZATIONS
APPLICABLE_ROLES
CHARACTER_SETS
CHECK_CONSTRAINTS
COLLATION_CHARACTER_SET_APPLICABILITY
COLLATIONS
COLUMN_PRIVILEGES
COLUMN_STATISTICS
COLUMNS
COLUMNS_EXTENSIONS
ENABLED_ROLES
ENGINES
EVENTS
FILES
INNODB_BUFFER_PAGE
INNODB_BUFFER_PAGE_LRU
INNODB_BUFFER_POOL_STATS
INNODB_CACHED_INDEXES
INNODB_CMP
INNODB_CMP_PER_INDEX
INNODB_CMP_PER_INDEX_RESET
INNODB_CMP_RESET
INNODB_CMPMEM
INNODB_CMPMEM_RESET
INNODB_COLUMNS
INNODB_DATAFILES
INNODB_FIELDS
INNODB_FOREIGN
INNODB_FOREIGN_COLS
INNODB_FT_BEING_DELETED
INNODB_FT_CONFIG
INNODB_FT_DEFAULT_STOPWORD
INNODB_FT_DELETED
INNODB_FT_INDEX_CACHE
INNODB_FT_INDEX_TABLE
INNODB_INDEXES
INNODB_METRICS
INNODB_SESSION_TEMP_TABLESPACES
INNODB_TABLES
INNODB_TABLESPACES
INNODB_TABLESPACES_BRIEF
INNODB_TABLESTATS
INNODB_TEMP_TABLE_INFO
INNODB_TRX
INNODB_VIRTUAL
KEY_COLUMN_USAGE
KEYWORDS
OPTIMIZER_TRACE
PARAMETERS
PARTITIONS
PLUGINS
PROCESSLIST
PROFILING
REFERENTIAL_CONSTRAINTS
RESOURCE_GROUPS
ROLE_COLUMN_GRANTS
ROLE_ROUTINE_GRANTS
ROLE_TABLE_GRANTS
ROUTINES
SCHEMA_PRIVILEGES
SCHEMATA
SCHEMATA_EXTENSIONS
ST_GEOMETRY_COLUMNS
ST_SPATIAL_REFERENCE_SYSTEMS
ST_UNITS_OF_MEASURE
STATISTICS
TABLE_CONSTRAINTS
TABLE_CONSTRAINTS_EXTENSIONS
TABLE_PRIVILEGES
TABLES
TABLES_EXTENSIONS
TABLESPACES
TABLESPACES_EXTENSIONS
TRIGGERS
USER_ATTRIBUTES
USER_PRIVILEGES
VIEW_ROUTINE_USAGE
VIEW_TABLE_USAGE
VIEWS */

select * from information_schema.keywords;
select * from information_schema.triggers;
select * from information_schema.views;
select * from information_schema.tables;
select * from information_schema.routines;
select * from information_schema.schemata;
select * from information_schema.SCHEMA_PRIVILEGES;
select * from information_schema.processlist;
select * from information_schema.plugins;
select * from information_schema.engines;
select * from information_schema.parameters;
select * from information_schema.STATISTICS;
select * from information_schema.TABLE_CONSTRAINTS;

-- ------------performance schema  default database  --------------------------------------------
show databases;

use performance_schema;
show table status;

select * from performance_schema.global_variables;

select * from performance_schema.global_status;

select * from performance_schema.users;

select * from performance_schema.accounts;


-- ------------------Sys schema default database --------------------------------------------------
use sys;
show tables;
select * from sys.processlist;
select * from sys.session;
select * from sys.sys_config;