-- DML (Data Manipulation Language)
/*  
	1. INSERT: we can insert some records in a table
    
    2. UPDATE: we can modify the existing table records 
    Delete
*/

use da;

show tables;

desc employees;

alter table employees drop column location;


-- ---------------------------------------------------------
-- INSERT 
insert into employees(empid, first_name, last_name, age, doj, address, dept)
values
('emp01', 'malli', 'arjun', 27, '2024-03-10', 'HYD', 'IT'); -- Date form(yyyy-mm-dd)

select*from employees;

insert into employees(empid, first_name, last_name, age, doj, address, dept)
values
('emp02', 'ravi', 'teja', 42, '2004-02-05', 'VSp', 'TESTING'),
('emp03', 'peter', 'dinklage', 42, '2014-12-05', 'INR', 'DEV');

-- 2nd method

insert into employees values
('emp04', 'the', 'rock', 53, '1984-02-05', 'MIA', 'SMC'),
('emp05', 'the', 'shield', 25, '2014-12-05', 'USA', 'DES'),
('emp06', 'the', 'undertaker', 61, '1969-05-27', 'GRA', 'KILL');


-- 3rd METHOD

insert into employees(empid, first_name, age, address, dept) 
values
('emp07', 'roman', 35, 'USA', 'WIN');

insert into employees(empid, last_name, age, doj, address ) 
values
('emp08', 'dean', 35, '2014-11-16','USA');

-- 4th method

insert into employees set
empid='emp09', last_name = 'rollins', age = 33, doj = '2024-10-13', address = 'NY', dept = 'CHE'; /* multiple records not possible*/


-- UPDATE

update employees set age =22 where empid = 'emp01';

select * from employees where empid = 'emp01';

select * from employees;

update employees set last_name = 'reigns' where dept = 'WIN';

update employees set doj = curdate() where last_name = 'reigns';



-- DELETE

delete from employees where empid = 'emp07' limit 1;

select * from employees;



-- what are the differences between drop, delete, & truncate?
/* 

DELETE: 1. it deletes records based on some condition
		2. table structure is present.
        3. we can rollback data.
        4. performance is slow.
        
TRUNCATE: 1. it removes all records present in a table.
		  2. table structure present.
          3. we can't rollback records.
          4. performance is high

DROP: 1. it removes tables records and structure 
	  2. table structure get's disturbed.
      3.performance is low compared to truncate.
*/

