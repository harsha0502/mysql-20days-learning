-- numeric and string functions
use da;

select abs(-100) as absolute_value;
/* ceil()

floor()

mod()

pow(2,3)

sqrt(16)

radians(180)

degrees()

sign()

rand()

greatest()


*/

select radians() as radians_value;
select rand()*10 as random_number;

drop table employees;

CREATE TABLE employees (
	emp_id INT PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	email VARCHAR(60),
	phone_number VARCHAR(20),
	department VARCHAR(30),
	city VARCHAR(30),
	salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(101,'Rahul','Kumar','rahul.kumar@gmail.com','987-654-3210','IT','Hyderabad',45000),
(102,'Anita','Sharma','anita.sharma@yahoo.com','912-345-6789','HR','Bangalore',38000),
(103,'Suresh','Verma','suresh.verma@gmail.com','998-123-4567','Sales','Chennai',52000),
(104,'Priya','Singh','priya.singh@outlook.com','900-456-7890','Finance','Pune',47000),
(105,'Rahul','Joshi','rahul.joshi@gmail.com','955-888-1111','Testing','Delhi',41000),
(106,'Kiran','Reddy','kiran.reddy@gmail.com','901-222-3333','IT','Hyderabad',56000),
(107,'Deepika','Naidu','deepika.naidu@yahoo.com','944-111-2222','HR','Vizag',39000),
(108,'Mahesh','Patel','mahesh.patel@gmail.com','933-444-5555','Sales','Mumbai',62000),
(109,'Divya','Gupta','divya.gupta@gmail.com','955-777-8888','Finance','Delhi',49000),
(110,'Arjun','Rao','arjun.rao@gmail.com','988-999-7777','Developer','Hyderabad',68000);

SELECT*FROM EMPLOYEES;

-- STRING FUNCTIONS

--   concatination
select concat(first_name , last_name) as full_name from employees;

-- changing of casing
select first_name, upper(first_name) as upper_name from employees;
select first_name, lower(last_name) as lower_case_name from employees;


-- Substring
select email, substring(email, 1,5) as email_prefix from employees;

-- Length
select first_name, length(first_name) as name_length from employees;

-- Replacement
select phone_number, replace(phone_number,'-','') as clean_phone from employees;


-- Trim method ( removes spaces around)
insert into employees(emp_id, first_name) values(111, '  sunny ');
select * from employees;
select first_name, trim(first_name) as trimmed_name from employees;

-- position
select first_name, position('sh' in first_name) as position_of_a from employees;

-- Reverse
select last_name, reverse(last_name) as reversed_name from employees;

-- short name
select last_name, left(last_name, 3) as short_name from employees;

-- end name
select last_name, right(last_name, 3) as end_name from employees;

-- lpad and rpad
select first_name, lpad(first_name, 10, '*') as padded_name from employees;
select first_name, rpad(first_name, 10, '*') as padded_name from employees;


SELECT CURDATE() AS CURRENT__DATE;
SELECT CURTIME() AS CURRENT__TIME;
SELECT NOW() AS CURRENT_DATE_TIME;
SELECT sysdate() AS SYSTEM_DATE_TIME;
SELECT DATE(NOW())AS EXTRACTED_DATE;
SELECT TIME(NOW())AS EXTRACTEED_TIME;
SELECT YEAR(NOW())AS YEAR_PART;
SELECT MONTH(NOW())AS MONTH_PART;
SELECT DAY(NOW())AS DAY_PART;
SELECT DAYOFWEEK(NOW())AS DAY_OF_WEEK;
SELECT DATE_ADD(NOW(),INTERVAL 10 DAY)AS NEW_DATE;
SELECT DATE_SUB(NOW(),INTERVAL 20 DAY)AS EARLY_DATE;
SELECT DATEDIFF(NOW(),'2000-05-23')AS DAYS_DIFF;
SELECT LAST_DAY(NOW())AS LAST_DAY_OF_MONTH;
SELECT MAKEDATE(2024,60)AS RESULT_DATE;
SELECT MAKETIME(14,30,15)AS RESULT_TIME;


select
sysdate(),
sleep(3),
sysdate();





