-- operators
/* it is a symbol. it performs a specific task.alter.

Syntax
-------------------
operand   operator   operand
a			+			b
10			+			20

1. Arithmetic Operators.
2. Comparison Operators.
3. Logical operators.
*/

use da;

drop table products;

CREATE TABLE Products (
 id INT,
 name VARCHAR(100),
 price DECIMAL(10,2),
 qty INT
 );

INSERT INTO Products VALUES
 (1, 'Pen', 10.00, 100),
 (2, 'Notebook', 25.00, 50),
 (3, 'Pencil', 5.00, 200),
 (4, 'Eraser', 3.00, 300),
 (5, 'Marker', 15.00, 80),
 (6, 'Scale', 20.00, 150),
 (7, 'Sharpener', 8.00, 120),
 (8, 'Geometry Box', 120.00, 40),
 (9, 'Sketch Pen', 60.00, 75),
 (10, 'Crayons', 90.00, 55);
 
 
 select * from products;
 
 -- AS - Column alias
 select name, price, 1.12*price as price_with_tax from products;
 
 
 -- discounted price
 select name, price, price-5 as discounted_price from products;
 
 -- inventory price for each product
 select name, price, qty, price*qty as inventory_price from products;
 
 -- price per 10 units
 select name, price, price*10 as price_per_10_units from products;
 
 -- qty multiple of 50
 select name, price, qty, qty%50!= 0 as qty_in_50s from products;



-- UPDATE

update products set qty = qty + 2;
select * from products;

-- sub 5 for every product
update products set price = price -5;

-- double erasers qty
update products set qty = qty*2 where name = 'Eraser';

-- half the qty of marker
update products set qty = qty/2 where name = 'Marker';

-- delete products where qty <100
delete from products where qty<100;

-- delete products where price < 10
delete from products where price < 10;



-- COMPARISON OPERATORS
CREATE TABLE StudentScores (
 id INT,
 name VARCHAR(100),
 subject VARCHAR(50),
 marks INT
 );


INSERT INTO StudentScores VALUES
 (1, 'Alice', 'Math', 95),
 (2, 'Bob', 'Math', 76),
 (3, 'Charlie', 'Math', 59),
 (4, 'Diana', 'Math', 88),
 (5, 'Eve', 'Math', 40),
 (6, 'Frank', 'Math', 95),
 (7, 'Grace', 'Science', 67),
 (8, 'Henry', 'Science', 82),
 (9, 'Ivy', 'English', 91),
 (10, 'Jack', 'English', 55),
 (11, 'Kevin', 'Math', 73),
 (12, 'Lily', 'Science', 48),
 (13, 'Mia', 'English', 100),
 (14, 'Noah', 'Math', 64),
 (15, 'Olivia', 'Science', 79);

SELECT*FROM STUDENTSCORES;

-- scores more than 80
select * from studentscores where marks >80;

-- scores more than or equal to 60
select * from studentscores where marks >= 60;

-- scores less than 50
select * from studentscores where marks < 50;

-- score is 95
select * from studentscores where marks = 95;

-- score is not 95
select * from studentscores where marks != 95;

-- score is 60 or less
select * from studentscores where marks <= 60;

-- UPDATE

-- update student score by +10 who scored  less than 50
update studentscores set marks = marks+10 where marks < 50;
select * from studentscores;

-- update student score by +10 who scored  less than or equal to 60
update studentscores set marks = marks+5 where marks <= 60;

-- add 2 for students who scored more than 90
update studentscores set marks = marks +2 where marks > 90;

-- add 3 for students who scored more than 80
update studentscores set marks = marks + 3 where marks > 80;

-- reduce 1 mark who did not score exaclty 95
update studentscores set marks = marks-1 where marks != 95;

-- set full marks who scored exactly 95
update studentscores set marks = 100 where marks = 95;



-- DELETE

-- delete whose score is less than 50
delete from studentscores where marks<50;
select * from studentscores;

-- delete who scored below 60
delete from studentscores where marks <60;

-- delete who scored above 90
delete from studentscores where marks > 90;

-- delete who scored 80 or above
delete from studentscores where marks >= 80;

-- delete who scored not equal to 95
delete from studentscores where marks != 95;

-- delete students who scored equal to 76
delete from studentscores where marks = 76;


-- LOGICAL OPERATORS
/* 
AND		 OR		 NOT
both	either	 opp

*/

drop table employees;


CREATE TABLE Employees (
   id INT,
   name VARCHAR(100),
   department VARCHAR(100),
   salary INT,
   isactive BOOLEAN
);

insert into employees values(1, 'Rahul Sharma', 'IT', 50000, TRUE),
(2, 'Priya Reddy', 'HR', 30000, TRUE),
(3, 'Amit Kumar', 'Finance', 45000, FALSE),
(4, 'Sneha Patel', 'IT', 35000, TRUE),
(5, 'Vikram Singh', 'Finance', 28000, TRUE),
(6, 'Anjali Mehta', 'HR', 32000, FALSE),
(7, 'Kiran Rao', 'IT', 60000, TRUE),
(8, 'Pooja Verma', 'Marketing', 27000, TRUE);

select * from employees;


-- it dept and salary > 40k
select * from employees where department = 'IT' and salary >40000;

-- hr dept or salary <35k
select * from employees where department = 'hr' OR salary <35000;

-- non hr
select * from employees where not department = 'hr'; -- != , <> can also be used

-- dept = finance sal >30k and active
select * from employees where department = 'finance' or salary >30000 and isactive = 1;



-- update
update employees set salary = salary + 2000 where department = 'IT' 
and isactive = true and salary <60000; 

update employees set salary = 0.9* salary where department = 'Finance' 
and isactive  = 0;

update employees set isactive = false where not department  = 'IT';