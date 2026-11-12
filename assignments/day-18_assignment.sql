create database ecommerce_trigger_db;

use ecommerce_trigger_db;

create table customers (
    customer_id int primary key,
    customer_name varchar(50),
    email varchar(100),
    mobile varchar(15),
    city varchar(50),
    wallet_balance decimal(10,2)
);

create table products (
    product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10,2),
    stock_quantity int,
    status varchar(20)
);

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    order_status varchar(30),
    foreign key (customer_id)
    references customers(customer_id)
);

create table order_items (
    item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    unit_price decimal(10,2),
    subtotal decimal(10,2),
    foreign key (order_id)
    references orders(order_id),
    foreign key (product_id)
    references products(product_id)
);


create table payments (
    payment_id int primary key,
    order_id int,
    payment_date date,
    payment_amount decimal(10,2),
    payment_method varchar(30),
    payment_status varchar(30),
    foreign key (order_id)
    references orders(order_id)
);

create table stock_history (
    history_id int auto_increment primary key,
    product_id int,
    old_stock int,
    new_stock int,
    change_type varchar(30),
    changed_at datetime,
    foreign key (product_id)
    references products(product_id)
);


create table order_audit (
    audit_id int auto_increment primary key,
    order_id int,
    old_status varchar(30),
    new_status varchar(30),
    changed_at datetime
);




INSERT INTO customers VALUES 
(1, 'Rahul', 'rahul@gmail.com', '9876543210', 'Hyderabad', 5000), 
(2, 'Priya', 'priya@gmail.com', '9876543211', 'Chennai', 8000), 
(3, 'Arjun', 'arjun@gmail.com', '9876543212', 'Bangalore', 3000), 
(4, 'Sneha', 'sneha@gmail.com', '9876543213', 'Vizag', 10000), 
(5, 'Kiran', 'kiran@gmail.com', '9876543214', 'Pune', 2000); 
 
INSERT INTO products VALUES 
(101, 'Laptop', 'Electronics', 55000, 20, 'AVAILABLE'), 
(102, 'Mobile', 'Electronics', 25000, 15, 'AVAILABLE'), 
(103, 'Headphones', 'Accessories', 2000, 50, 'AVAILABLE'), 
(104, 'Keyboard', 'Accessories', 1500, 30, 'AVAILABLE'), 
(105, 'Smart Watch', 'Electronics', 5000, 10, 'AVAILABLE'), 
(106, 'Monitor', 'Electronics', 12000, 0, 'OUT_OF_STOCK'), 
(107, 'Mouse', 'Accessories', 800, 40, 'AVAILABLE'); 
 
INSERT INTO orders VALUES 
(1001, 1, '2026-11-01', 57000, 'PLACED'), 
(1002, 2, '2026-11-02', 25000, 'CONFIRMED'), 
(1003, 3, '2026-11-03', 7000, 'SHIPPED'), 
(1004, 4, '2026-11-04', 12000, 'DELIVERED'), 
(1005, 5, '2026-11-05', 5000, 'CANCELLED'); 
 
 
INSERT INTO order_items VALUES 
(1, 1001, 101, 1, 55000, 55000), 
(2, 1001, 103, 1, 2000, 2000), 
(3, 1002, 102, 1, 25000, 25000), 
(4, 1003, 105, 1, 5000, 5000), 
(5, 1003, 107, 2, 800, 1600), 
(6, 1004, 104, 8, 1500, 12000), 
(7, 1005, 105, 1, 5000, 5000); 
 
INSERT INTO payments VALUES 
(501, 1001, '2026-11-01', 57000, 'UPI', 'SUCCESS'), 
(502, 1002, '2026-11-02', 25000, 'CARD', 'SUCCESS'), 
(503, 1003, '2026-11-03', 7000, 'NETBANKING', 'SUCCESS'), 
(504, 1004, '2026-11-04', 12000, 'UPI', 'SUCCESS'), 
(505, 1005, '2026-11-05', 5000, 'CARD', 'REFUNDED');

--                                      TRIGGERS

-- Price greater than 0
delimiter //

create trigger validate_product_price
before insert on products
for each row
begin
    if new.price <= 0 then
        signal sqlstate '45000'
        set message_text = 'product price must be greater than zero';
    end if;
end //

delimiter ;

-- QTY >0
delimiter //

create trigger validate_product_stock
before insert on products
for each row
begin
    if new.stock_quantity < 0 then
        signal sqlstate '45000'
        set message_text = 'stock quantity cannot be negative';
    end if;
end //

delimiter ;
