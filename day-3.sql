use da;

create table employees(
	empid char(5),
    fname varchar (50),
    lname varchar(30),
    age int,
    doj date,
    address tinytext,
    dept varchar(20)
);

desc employees;