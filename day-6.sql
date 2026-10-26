use da;

insert into products(product_id, name, price, qty)
values (1, 'mobile', 13000, 2),
(2, 'headphone', 3500, 3);

update products set qty = 5 where product_id = 1;

select * from products;

alter table products
change name product_name varchar(20);

update products set price = 2000 where product_name = 'headphone';


-- CONSTRAINTS 

/* constraints are applied to table column to ensure that only valid and accurate data is stored in the database.

--- rules that control the data entered into a table.
1. not null: no nulls
2. unique: no dups
3. primary key: unique + not null
4. composite key
5. foreign key
6. check constraint
7. default constraint
*/
create table students1 (
sid int unique not null);
