-- Queries and sub-queries(inner query)
/* 
  1. single row sub-query
  2. multi-row sub-query(IN, ANY, ALL)
  3. nested (sub - sub)
  
*/
use newdb;

CREATE TABLE Customers (
  customer_id	INT PRIMARY KEY,
  customer_name  VARCHAR(50),
  city       	VARCHAR(50),
  customer_type  VARCHAR(20)
);
 
CREATE TABLE Products (
  product_id 	INT PRIMARY KEY,
  product_name   VARCHAR(50),
  category   	VARCHAR(30),
  price      	DECIMAL(10,2)
);
 
CREATE TABLE Orders (
  order_id   	INT PRIMARY KEY,
  customer_id	INT REFERENCES Customers(customer_id),
  product_id 	INT REFERENCES Products(product_id),
  quantity   	INT,
  order_date 	DATE,
  amount     	DECIMAL(10,2)
);


INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (1, 'Rahul', 'Delhi', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (2, 'Meena', 'Mumbai', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (3, 'Arjun', 'Bangalore', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (4, 'Kavya', 'Delhi', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (5, 'Suresh', 'Chennai', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (6, 'Anjali', 'Mumbai', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (7, 'Vikram', 'Delhi', 'Regular');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (8, 'Pooja', 'Bangalore', 'Premium');
INSERT INTO Customers (customer_id, customer_name, city, customer_type) VALUES (9, 'Devi', 'Chennai', 'Regular');



INSERT INTO Products (product_id, product_name, category, price) VALUES (1, 'Laptop', 'Electronics', 55000);
INSERT INTO Products (product_id, product_name, category, price) VALUES (2, 'Mobile', 'Electronics', 25000);
INSERT INTO Products (product_id, product_name, category, price) VALUES (3, 'Chair', 'Furniture', 7000);
INSERT INTO Products (product_id, product_name, category, price) VALUES (4, 'Table', 'Furniture', 9000);
INSERT INTO Products (product_id, product_name, category, price) VALUES (5, 'Headphones', 'Electronics', 3000);
INSERT INTO Products (product_id, product_name, category, price) VALUES (6, 'Bookshelf', 'Furniture', 6000);


INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (1, 1, 1, 1, '2023-01-05', 55000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (2, 2, 2, 1, '2023-01-10', 25000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (3, 3, 3, 2, '2023-02-01', 14000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (4, 1, 5, 2, '2023-02-15', 6000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (5, 4, 4, 1, '2023-03-03', 9000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (6, 5, 2, 2, '2023-03-20', 50000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (7, 6, 4, 3, '2023-04-02', 18000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (8, 3, 5, 1, '2023-04-15', 3000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (9, 7, 3, 1, '2023-05-01', 7000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (10, 8, 1, 1, '2023-05-20', 54000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (11, 2, 3, 2, '2023-06-02', 12000);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, amount) VALUES (12, 5, 4, 1, '2023-06-15', 8500);


select*from customers;
select*from products;
select*from orders;

select product_name, price 
from products 
where price = (select max(price) from products);


-- Order with smallest order amount
select order_id, customer_id, amount
from orders
where amount = (select min(amount) from orders);


-- find the name of the customer who placed the order 5
select customer_name
from customers 
where customer_id = (select customer_id 
from orders 
where order_id = 5); 

-- 
select category
from products
where product_id = (select product_id 
from orders 
where order_id = 1);

-- find the name of customers who live in delhi or mumbai
select customer_name from customers where city in ('mumbai', 'delhi');

-- names of products that have been ordered atleast once.
select product_name from products where product_id in (select product_id from orders);


-- names of products that haven't been ordered atleast once.
select product_name from products where product_id not in (select product_id from orders);


-- find the names of customers who have placed at least one order
select customer_name from customers where customer_id in (select customer_id from orders);

-- find the products priced greater than any product in the 'furniture' category 
select product_name, price from products
where price> any(select price from products where category = 'furniture');

select product_name, price from products
where price> all(select price from products where category = 'furniture');

select min(price) as third_least from products
where price>(select min(price) from products -- 6000
where price> (select min(price) from products)); -- 3000

-- find the names of the customers who ordered the most expensive product
select customer_name
from customers where customer_id in(select customer_id from orders where product_id = (select product_id from products 
where price = (select max(price) from products)));