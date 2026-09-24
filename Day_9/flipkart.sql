-- =========================================================
-- FLIPKART DATABASE - SQL JOINS
-- =========================================================

CREATE DATABASE flipkart;

USE flipkart;


-- =========================================================
-- 1. USERS TABLE
-- =========================================================

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    referred_by INT
);


-- =========================================================
-- 2. PRODUCTS TABLE
-- =========================================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);


-- =========================================================
-- 3. ADD TO FAVOURITE TABLE
-- =========================================================

CREATE TABLE add_to_favourite (
    fav_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    added_date DATE,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);


-- =========================================================
-- 4. INSERT USERS
-- =========================================================

INSERT INTO users
(user_id, user_name, email, city, referred_by)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 'Hyderabad', NULL),
(2, 'Priya', 'priya@gmail.com', 'Chennai', 1),
(3, 'Arjun', 'arjun@gmail.com', 'Bangalore', 1),
(4, 'Sneha', 'sneha@gmail.com', 'Mumbai', 2),
(5, 'Kiran', 'kiran@gmail.com', 'Delhi', 3),
(6, 'Meena', 'meena@gmail.com', 'Pune', 2);


-- =========================================================
-- 5. INSERT PRODUCTS
-- =========================================================

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'iPhone 15', 'Mobile', 69999),
(102, 'Samsung Galaxy S24', 'Mobile', 74999),
(103, 'HP Laptop', 'Laptop', 55999),
(104, 'Dell Laptop', 'Laptop', 64999),
(105, 'Sony Headphones', 'Electronics', 8999),
(106, 'Nike Shoes', 'Footwear', 5999),
(107, 'Smart Watch', 'Electronics', 3999),
(108, 'Canon Camera', 'Camera', 45999);


-- =========================================================
-- 6. INSERT FAVOURITE PRODUCTS
-- =========================================================

INSERT INTO add_to_favourite
(fav_id, user_id, product_id, added_date)
VALUES
(1, 1, 101, '2026-09-01'),
(2, 1, 105, '2026-09-02'),
(3, 2, 102, '2026-09-03'),
(4, 2, 106, '2026-09-04'),
(5, 3, 103, '2026-09-05'),
(6, 3, 107, '2026-09-06'),
(7, 4, 104, '2026-09-07'),
(8, 5, 101, '2026-09-08'),
(9, 5, 108, '2026-09-09');


-- =========================================================
-- CHECK TABLES
-- =========================================================

SELECT * FROM users;

SELECT * FROM products;

SELECT * FROM add_to_favourite;

# inner join 
-- Display users who have added products to their favourites.
SELECT u.user_id, u.user_name, a.product_id
FROM users u
INNER JOIN add_to_favourite a ON u.user_id = a.user_id;
		#(or)
select
	U.USER_ID,
    U.USER_NAME,
    F.PRODUCT_ID
FROM USERS u
INNER JOIN add_to_favourite f
ON U.USER_ID =F.USER_ID;

-- Display user name, product name and favourite date
select
u.user_name,
p.product_name,
f.added_date
from users u 
inner join add_to_favourite f
on u.user_id=f.user_id
inner join products p 
on f.product_id=p.product_id;

-- =========================================================
-- 2. equi join
-- =========================================================
-- Display user name and favourite product id
-- Using a equality condition.
select u.user_name, a.product_id
from users u, add_to_favourite a
where u.user_id = a.user_id;
		#(or)
-- using joins
select 
u.user_name,
f.product_id
from users u
join add_to_favourite f 
on u.user_id=f.user_id;

-- display username and product name
-- Display username and product name
-- using equi
select 
u.user_name,
p.product_name
from users u
join add_to_favourite f 
on u.user_id=f.user_id
join products p 
on f.product_id=p.product_id;
		#(or)
SELECT 
    u.user_name,
    p.product_name
FROM users u
INNER JOIN add_to_favourite f 
    ON u.user_id = f.user_id
INNER JOIN products p 
    ON f.product_id = p.product_id;

-- =========================================================
-- creating table price_category()
-- =========================================================
CREATE TABLE price_category( category_name varchar(30),min_price decimal(10,2),max_price decimal(10,2));

-- =========================================================
-- Inserting values into price_category
-- =========================================================
insert into price_category(category_name,min_price,max_price)
values("Budget", 0, 10000),('Mid Range', 10001, 50000),('Premium',50001,100000);
select * from price_category;

-- Display product name, price and price category.
select p.product_name,p.price, pc.category_name
from products p
join price_category pc on p.price between pc.min_price and pc.max_price;

-- =========================================================
-- natural join
-- =========================================================
-- display users and fav records.
select * from users natural join add_to_favourite;

select * from products natural join add_to_favourite;

select * from users natural join products;

-- =========================================================
-- SELF Join
-- =========================================================
-- Display every user and the person who referred them.
SELECT 
u.user_name AS user_name,
r.user_name AS referred_by
FROM users u
LEFT JOIN users r
ON u.referred_by = r.user_id;
-- =========================================================
-- LEFF Join
-- =========================================================
-- Display all users and their favourite products.
-- Users without favourites should also appear.
select u.user_id,u.user_name, f.product_id
from users u
Left join add_to_favourite f on u.user_id=f.user_id;

-- =========================================================
-- RIGHT Join
-- =========================================================
-- Display all products and the users who added them to favourites. 

SELECT p.product_id, p.product_name, f.user_id
FROM add_to_favourite f
RIGHT JOIN products p 
ON f.product_id = p.product_id;

-- =========================================================
-- FULL Join
-- =========================================================
-- My Sql does not supports full outer join. 
-- we use union. 
-- Display all users and all favourtie records.
select 
u.user_id, 
u.user_name,
f.product_id
from users u
left join add_to_favourite f
on u.user_id=f.user_id;
-- =========================================================
-- CROSS Join
-- =========================================================
select u.user_name,p.product_name
from users u cross join products p;


