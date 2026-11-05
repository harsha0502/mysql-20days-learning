
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

drop table employees;

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









