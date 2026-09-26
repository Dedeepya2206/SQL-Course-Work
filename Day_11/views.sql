-- 1. Create Database
CREATE DATABASE training_center;
USE training_center;

-- 2. Create Tables

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    course VARCHAR(50),
    fees INT
);

CREATE TABLE trainers (
    trainer_id INT PRIMARY KEY,
    trainer_name VARCHAR(50),
    experience INT,
    subject VARCHAR(50),
    salary INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration_months INT,
    fees INT
);

-- 3. Insert Sample Data

INSERT INTO students VALUES
(1,'Rahul',21,'Hyderabad','Python',25000),
(2,'Sneha',22,'Chennai','Java',30000),
(3,'Arjun',20,'Bangalore','Python',25000),
(4,'Divya',23,'Delhi','MySQL',20000),
(5,'Kiran',21,'Mumbai','Java',30000),
(6,'Meena',22,'Hyderabad','Python',25000);

INSERT INTO trainers VALUES
(101,'Ramesh',5,'Python',50000),
(102,'Anita',7,'Java',60000),
(103,'Suresh',4,'MySQL',45000);

INSERT INTO courses VALUES
(201,'Python',6,25000),
(202,'Java',8,30000),
(203,'MySQL',4,20000);

select * from students;
select * from trainers;
select * from courses;

-- View python students only.
create view python_students as
select * from students where course = 'python';
select * from python_students;

-- High Fee students
create View high_fee_students as
select * from students where fees > '25000';
select * from high_fee_students;
 
-- Experienced Trainers
Create View experienced_trainers_view as
select trainer_name, subject from trainers where experience >= 5;
select * from experienced_trainers_view;

-- short Duration Courses
Create View short_courses_view as
select course_name from  courses where duration_months >=3;
select * from short_courses_view;

-- students fee summary. 
create view students_fee_summary_view as
select 
	count(*) As total_students,
    sum(Fees) as total_fees,
    avg(fees) as avg_fees
from students;
select * from students_fee_summary_view;

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

#Drop view student_fee_summary_view;
