use da;

show tables; 

alter table employees
modify fName varchar(30);

-- how to add a column after a particular column
-- syntax : alter table table-name add column-name datatype(size) after specified-column-name

alter table employees
add location tinytext,
add pfid int after empid;

desc employees;

alter table employees
add companyname varchar(15) first;

alter table employees
modify companyname text;

-- how to change column-name 
-- syntax:- alter table table-name change existing-column-name new-column-name datatype(size);

alter table employees
change fname first_name varchar(40),
change lname last_name varchar(40);


-- how to drop a column
-- syntax: alter table table-name drop column column-name

alter table employees
drop column companyname,
drop column pfid;


-- how to change table name
-- syntax: alter table table-name rename to new-table-name


alter table employees
rename to codegnan_emp;

alter table codegnan_emp rename to employees;


create table company_staff(
emp_id int,
age tinyint,
experience smallint,
gender char(1),
emp_name varchar(50),
address tinytext,
salary decimal(10,2),
department enum('HR', 'IT', 'Sales', 'finanace', 'support'),
skills set('java', 'python', 'sql', 'excel', 'communication'),
joining_date date
);

desc company_staff;

alter table company_staff
modify emp_id int primary key;


alter table company_staff 
add email varchar(100),
add phone_number bigint,
add bonus decimal(8,2) after salary,
add status varchar(20) after department,
add company_name varchar(30) first;

alter table company_staff 
change emp_name employee_name varchar(100),
change joining_date date_of_joining date,
drop column bonus,
drop column phone_number;





