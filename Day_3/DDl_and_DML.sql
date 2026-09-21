CREATE DATABASE InstagramDB;
use InstagramDB;
CREATE TABLE users (
  user_id INT PRIMARY KEY NOT NULL,
  user_name VARCHAR(50), 
  full_name VARCHAR(50) NOT NULL,
  mail VARCHAR(50) UNIQUE
);
DROP TABLE users;
CREATE TABLE users (
  user_id INT PRIMARY KEY NOT NULL,
  user_name VARCHAR(50), 
  full_name VARCHAR(50) NOT NULL,
  Email VARCHAR(50) UNIQUE,
  Password VARCHAR(20) NOT NULL,
  Bio text,
  Is_verified boolean DEFAULT False,
  Created_at datetime default CURRENT_TIMESTAMP
);
desc users;
select * from users;
-- To add column name 
Alter table users
add column  phonenumber  varchar(10);

-- To Modify column:- changes the datatype or size of an existing column but keeps the same name.
alter table users
modify column full_name varchar(150);

-- To change column
alter table users
change column Bio Biography Text;

-- To drop columm
alter table users
Drop column phonenumber;
-- To rename the table
alter table users
rename to userinfo;

desc userinfo;

truncate table userinfo;
drop table userinfo;
 CREATE TABLE posts ( 
  postid INT PRIMARY KEY,
  user_id INT NOT NULL,
  Caption TEXT,
  ImageURL VARCHAR(255) NOT NULL,
  LikesCount INT DEFAULT 0,
  createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

desc posts;
CREATE TABLE Comments(
Comments INT PRIMARY KEY,
postid BIGINT NOT NULL,
User_id INT NOT NULL,
CommentText VARCHAR(255) NOT NULL,
createdat DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (postid) REFERENCES posts(postid)
);
SHOW TABLES;

 
 

