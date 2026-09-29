use flipkart;

-- creating table for online_customers.
create table online_customers(
id int,
name varchar(50));

-- creating table for store_customers.
create table store_customers(
id int, name varchar(50)
);

-- inserting values into online_customers
insert into online_customers values
(1,'Deepu'),
(2,'pallavi'),
(3,'Naimisha'),
(4,'Harsha'),
(5,'Nandini'),
(6,'chandralekha'),
(7,'Likitha');

-- Checking the values.
select * from online_customers;

-- inserting values into store_customers.
insert into store_customers values
(1,'rahul'),
(2,'Arjun'),
(3,'kiran'),
(5,'Anil'),
(6,'Abdul'),
(7,'Reena'),
(8,'Divya'),
(9,'Meena');

-- checking the values.
select * from store_customers;

-- union #remove the duplicates.
select name from online_customers
union
select name from store_customers;

-- union all # give duplicate values also
select name from online_customers
union all 
select name from store_customers;

UPDATE store_customers
SET name = 'Deepu'
WHERE id = 4;
SET SQL_SAFE_UPDATES = 0;

UPDATE store_customers
SET name = 'Pallavi'
WHERE id = 5;

UPDATE store_customers
SET name = 'Naimisha'
WHERE id = 6;

-- in
select name from online_customers
where name in (select name from store_customers);

-- not in
select name from online_customers
where name not in (select name from store_customers);


