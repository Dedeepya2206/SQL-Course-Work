-- system functions
use flipkart;


select version();
select database();
select user();
select connection_id();

-- create table last insert id name and city
create table customers (
 id int auto_increment primary key,
 name varchar(50),
 city varchar(50)
 );
 
 -- insert values
 insert into customers (name,city)
 values ('Rahul','Hyderabad');
 
 -- select last_insert_id()
 select LAST_INSERT_ID();
 
 -- insert another
 insert into customers(name,city)
 values ('priya', 'chennai');
 
 -- selecct last_insert_id()
 select LAST_INSERT_ID();
 
 
 
 
 

