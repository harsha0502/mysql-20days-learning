create database newdb;
use newdb;


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2)
);
 
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
 
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT
);
 
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Human Resources'), (2, 'Engineering'), (3, 'Marketing'), (4, 'Finance'), (5, 'Operations'),(6,'HR');
 
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES
(101, 'Arjun', 1, 50000), (102, 'Bhavana', 2, 65000), (103, 'Charan', 2, 72000),
(104, 'Divya', 3, 45000), (105, 'Eswar', NULL, 40000), (106, 'Farhan', 4, 55000),
(107, 'Gowri', 2, 62000), (108, 'Harish', 5, 48000), (109, 'Ishita', NULL, 53000),
(110, 'Jagan', 3, 60000);
 
INSERT INTO Projects (project_id, project_name, emp_id) VALUES
(201, 'Website Redesign', 102), (202, 'Mobile Banking App', 103), (203, 'Marketing Campaign', 104),
(204, 'Payroll System', 106), (205, 'Backend Optimization', 107), (206, 'Cloud Migration', 102),
(207, 'Customer Analytics', 110), (208, 'Inventory System', NULL);


select e.emp_id, e.name, d.department_name
from employees e
left join departments d
on e.department_id = d.department_id;


-- project and employees data
select e.emp_id, e.name, p.project_name
from employees e
left join projects p
on e.emp_id = p.emp_id;

-- departments where employees are not assigned
select d.department_id, d.department_name, e.name
from departments d
left join employees e
on d.department_id = e.department_id
where e.name is null;

-- employees where department is not assigned
select e.emp_id, e.name, d.department_name
from employees e
left join departments d
on e.department_id = d.department_id
where department_name is null;

-- employees where project is not assigned
select e.emp_id, e.name, p.project_name
from employees e
left join projects p
on e.emp_id = p.emp_id
where project_name is null;

-- Count employees per department
select d.department_name, count(e.emp_id) as total_employees
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name;

-- count project per employee
select e.name, count(p.project_name) as total_projects
from employees e
left join projects p
on e.emp_id = p.emp_id
group by name;


-- department wise total salary
select d.department_name, sum(e.salary) as total_salary
from departments d
join employees e
on d.department_id = e.department_id
group by d.department_name;


-- department wise employees count and in descending order of total_employees
select d.department_name, count(e.emp_id) as total_employees
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name
order by total_employees desc;


-- department wise total salary ascending order
select d.department_name, sum(e.salary) as total_salary
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name
order by total_salary;


-- department wise employees count where count > 1and in descending order of total_employees
select d.department_name, count(e.emp_id) as total_employees
from departments d
join employees e 
on d.department_id = e.department_id
group by d.department_name
having total_employees > 1
order by total_employees desc;


-- department wise average salary and > 40000 ascending order
select d.department_name, avg(e.salary) as avg_salary
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name
having avg_salary > 40000
order by avg_salary;


-- department wise average salary and > 40000 ascending order
select d.department_name, avg(e.salary) as avg_salary
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name
order by avg_salary desc
limit 1;












