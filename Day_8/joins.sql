# inner join - common ele
# equi join - ==
# non-equi join -
# natural join - common coloum names
# self join - same table diff representations
CREATE DATABASE join_practice;
USE join_practice;

/*
inner join
equi join
non-equi join
natural join
self join
outer join
	left join
	right join
	full join
cross join
*/

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    city VARCHAR(100)
);


CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    caption VARCHAR(255),
    foreign key (user_id) references users(user_id)
);


INSERT INTO users (username, city) VALUES
('rahul', 'Hyderabad'),
('sneha', 'Bangalore'),
('arjun', 'Chennai'),
('meena', 'Mumbai'),
('kiran', 'Delhi'),
('anita', 'Pune'),
('vikram', 'Kolkata'),
('divya', 'Jaipur'),
('rohit', 'Ahmedabad'),
('pooja', 'Lucknow');



INSERT INTO posts (user_id, caption) VALUES
(1, 'Morning workout'),
(2, 'Learning SQL joins'),
(3, 'Data analytics journey'),
(1, 'Weekend trip'),
(4, 'Office presentation'),
(5, 'Startup ideas'),
(1, 'Test post without valid user'),
(3, 'Python practice'),
(7, 'Cloud computing basics'),
(2, 'Another invalid user post');

select * from posts;
select * from users;
/*
# inner join
-- syntax
		 SELECT columns
		 FROM table1
		 INNER JOIN table2
		 ON table1.column = table2.column;
*/
        
select users.username, posts.caption
from posts inner join users on
users.user_id = posts.user_id;
		#(or)
select u.username,p.caption
from users u inner join posts p
on u.user_id = p.user_id;
/*
#equi join

	SELECT columns
	FROM table1
	INNER JOIN table2
	ON table1.column = table2.column;
*/

select u.username,p.caption
from users u, posts p
where u.user_id=p.user_id;

/*
# natural join
SELECT columns
FROM table1
NATURAL JOIN table2;
*/
select * from users natural join posts;
/*
# left join
-- syntax
		SELECT columns
		FROM table1
		INNER JOIN table2
		ON table1.column = table2.column;
*/
select u.username,p.caption
from users u left join posts p
on u.user_id = p.user_id;

/*
# right join
-- syntax
		SELECT columns
		FROM table1
		right JOIN table2
		ON table1.column = table2.column;
*/
select u.username,p.caption
from users u right join posts p
on u.user_id = p.user_id;

/*
# union
-- syntax
	SELECT column1, column2 FROM table1
	UNION
	SELECT column1, column2 FROM table2;

*/
SELECT username AS text_data FROM users
UNION
SELECT caption FROM posts;

