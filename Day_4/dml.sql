use InstagramDB;
insert into users(user_id,user_name,full_name,Email,Password) values(1,'Dedeepya','Kotha Dedeepya','dedeepya@gmal.com','deepu@2215');
insert into users(user_id,user_name,full_name,Email,Password) values(2,'pallavi','gumpull pallavi','pallavi@gmail.com','pallavi@221'),
(3,'Naimisha','K naimisha','naimisha@gmail.com','naimisha@1111'), 
(4,'Harsha','P Harsha','harsha@gmail.com', 'harsha@123'), 
(5,'Nandhini', 'K Nandhini', 'nandini@gmail.com', 'nandini@234'),
(6,'Satwika', 'S Satwika', 'satwika@gmail.com','satwika@345'),
(7,'Teja', 'T Teja', 'teja@gmail.com', 'teja@456');

insert into users
values(8,'sai','M Sai', 'sai@gmail.com','sai@678','Python developer',True,'2026-09-12 09:41:39');
select * from users;

update users 
set password = "sai@146"
where email ="sai@gmail.com";

update users
set Biography = 'Python Developer'
where user_id=1;

update users
set Is_verified = True
where user_id = 2;

update users
set Biography = 'coder'
where user_id=3;

update users
set Is_verified = True
where user_id = 1;


select @@sql_safe_updates;
SET SQL_SAFE_UPDATES = 0;

update users
set Is_verified = True;

DELETE FROM users
where full_name= 'Teja';

update users 
set password = "dedeepya@gmail.com"
where user_id=1;