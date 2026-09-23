create database flipkart;
use flipkart;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT,
    CreatedAt DATE,
    IsAvailable BOOLEAN
);

-- =========================================
-- 2. INSERT 20 PRODUCTS
-- =========================================y

INSERT INTO Products VALUES
(1, 'iPhone 15', 'Electronics', 80000, 10, '2024-01-10', TRUE),
(2, 'Samsung S24', 'Electronics', 75000, 15, '2024-02-15', TRUE),
(3, 'Dell Laptop', 'Electronics', 65000, 5, '2023-12-01', TRUE),
(4, 'HP Laptop', 'Electronics', 60000, 7, '2023-11-20', TRUE),
(5, 'Office Chair', 'Furniture', 7000, 20, '2024-03-05', TRUE),
(6, 'Study Table', 'Furniture', 12000, 8, '2024-03-12', TRUE),
(7, 'Water Bottle', 'Accessories', 500, 50, '2024-01-01', TRUE),
(8, 'Backpack', 'Accessories', 1500, 30, '2024-02-01', TRUE),
(9, 'Smart Watch', 'Electronics', 15000, 12, '2024-04-01', TRUE),
(10, 'Bluetooth Speaker', 'Electronics', 3000, 25, '2024-04-10', TRUE),
(11, 'Notebook', 'Stationery', 50, 100, '2024-01-05', TRUE),
(12, 'Pen Pack', 'Stationery', 100, 200, '2024-01-08', TRUE),
(13, 'Gaming Mouse', 'Electronics', 2000, 18, '2023-10-10', TRUE),
(14, 'Keyboard', 'Electronics', 2500, 22, '2023-09-15', TRUE),
(15, 'Monitor', 'Electronics', 18000, 6, '2023-08-20', TRUE),
(16, 'Sofa', 'Furniture', 35000, 3, '2023-07-01', TRUE),
(17, 'Dining Table', 'Furniture', 40000, 2, '2023-06-10', FALSE),
(18, 'Headphones', 'Electronics', 5000, 14, '2024-05-01', TRUE),
(19, 'Coffee Mug', 'Accessories', 300, 60, '2024-05-05', TRUE),
(20, 'Tablet', 'Electronics', 30000, 9, '2024-06-01', TRUE);

select * from Products;

select * from products;

select productid from products;

select productname from products;

select productid, productname, stock from products;

select ProductName, Category, CreatedAt, IsAvailable from products;

select * from products where price<5000;

select * from products where stock>100;

select * from products where category='Electronics';

-- =========================================
-- Alisia name "as"
-- =========================================
select price as mrp from products;

select price as Cost, productname  from products;

-- =========================================
-- between and 
-- =========================================
select * from products  where price between 5000 and 10000;

select * from products where stock between 10 and 40;

select * from products where price between 6000 and 7000;

-- =========================================
-- like wise
-- =========================================
select * from products where productname like 'd%';

select * from products where productname like '%e';

select * from products where productname like '%i%';
-- =========================================
-- in and not in
-- =========================================
select * from products where category in("furniture", "Accessories");

select * from products where category not in("furniture", "Accessories");

-- =========================================
-- OrderBy
-- =========================================
select * from products order by price;

select * from products order by price asc;

select * from products order by price desc;

-- =========================================
-- Distinct give unique values
-- =========================================
select distinct category from products;

select distinct price from products;
-- =========================================
-- limit gives top rows
-- =========================================
select * from products limit 5;

-- =========================================
-- aggregation fns
-- =========================================
select sum(price) as TotalValue from products;

select avg(price) as AvgValue from products;

select min(price) as MinValue from products;

select max(price) as Max_Value from products;

select count(price) as Count_value from products;

select count(price) as TotalRows from products where category="electronics";

select count(*) as Total_rows from products;

select category, count(*) as ProductCount
from products
GROUP BY Category;

select category, max(price) as MaxiumPrice
from products
GROUP BY Category;

select category, min(price) as MinimumPrice
from products
GROUP BY Category;

select category, avg(price) as avgPrice
from products
GROUP BY Category;

select category, sum(Price) as Total_Price
from products
GROUP BY Category;

select category, sum(Price) as Total_Price, sum(stock) as total_stock
from products
GROUP BY Category;

select category, count(*) as productcount
from products
group by category having productcount<5;

select category, sum(price) as total_category_price
from products
group by category having total_category_price > 5000;

select category, min(price) as minimum_price
from products
group by category having minimum_price > 100;

select category, max(price) as maximum_price
from products
group by category having maximum_price > 100;

select category, avg(price) as avg_price
from products
group by category having avg_price > 100;

# ARITHEMATIC OPERATIONS
-- ADDITION 
SELECT ProductName, Price, Price + (price*0.1) AS IncreasedPrice
FROM Products;

-- SUBTRACTION
SELECT ProductName, Price, Price - (price*0.5) AS DecreasedPrice
FROM Products;

-- MULTIPLICATION
SELECT ProductName, Price, Price * 2  AS DoublePrice
FROM Products;

-- DIVISION
SELECT ProductName, Price, Price / 2 AS HalfPrice
FROM Products;

-- MODULUS (remainder)
SELECT ProductName, Stock, Stock % 2 AS StockRemainder
FROM Products;

#COMPARISION OPERATORS

-- Equal
SELECT * from products
where Category = 'Furniture';

-- NOT EQUAL
SELECT * From Products
where Category <> 'Electronics';

-- GREATER THAN
select * from Products
where Price > 20000;

-- LESS THAN
select * from Products
where Price < 5000;

-- GREATER OR EQUAl
select * from Products
where Price >= 20000;

-- LESS THAN  or EQUAL
select * from Products
where Price <= 5000;

# MEMBERSHIP OPERATORS
-- IS NULL
select * from Products
where Category IS NULL;

-- IS NOT NULL
select * from Products
where Category IS  NOT NULL;

# LOGICAL OPERATORS
-- AND
select * from Products
where Price > 10000 AND Stock > 5;

-- OR
select * from Products
where Category = 'Furniture'
OR Category = 'Stationary';

-- NOT
select * from Products
where NOT Category = 'Electronics';

# LOGICAL OPERATORS
-- AND
select * from Products
where Price > 10000 AND Stock > 5;

-- OR
select * from Products
where Category = 'Furniture'
OR Category = 'Stationary';

-- NOT
select * from Products
where NOT Category = 'Electronics';

# BITWISE OPERATORS
-- BITWISE AND
SELECT 10 & 6 AS BitwiseAND;

-- BITWISE OR
SELECT 10 | 6 AS BitwiseOR;

-- BITWISE XOR
SELECT 10 ^ 6 AS BitwiseNOT;

-- BITWISE NOT
SELECT ~10 AS BitwiseNOT;

-- LEFT SHIFT
SELECT 5 << 1 AS LeftShift;

-- RIGHT SHIFT
SELECT 20 >> 2 AS RightShift;

#Assinment Operator
 set @total:=100;
 select @total;
 
 select @total as assignedvalue;


