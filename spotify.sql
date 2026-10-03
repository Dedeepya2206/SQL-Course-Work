create database spotify_app;
use spotify_app;
-- Table: users
CREATE TABLE users (
user_id INT PRIMARY KEY,
name VARCHAR(50),
country VARCHAR(50),
subscription_type VARCHAR(20),
age INT
);
-- Table: artists
CREATE TABLE artists (
artist_id INT PRIMARY KEY,
artist_name VARCHAR(50),
country VARCHAR(50),
monthly_listeners INT
);
-- Table songs
CREATE TABLE songs (
song_id INT PRIMARY KEY,
title VARCHAR(100),
artist_id INT,
duration_seconds INT,
play_count INT
);
-- plays
CREATE TABLE plays (
play_id INT PRIMARY KEY,
user_id INT,
song_id INT,
play_date DATE
);

-- Insert values into users
INSERT INTO users VALUES
(1, 'Amit', 'India', 'Premium', 22),
(2, 'Sneha', 'India', 'Free', 20),
(3, 'John', 'USA', 'Premium', 25),
(4, 'Emma', 'UK', 'Free', 23),
(5, 'Rahul', 'India', 'Premium', 24),
(6, 'Priya', 'India', 'Free', 21),
(7, 'David', 'USA', 'Premium', 27),
(8, 'Sophia', 'UK', 'Free', 22),
(9, 'Kiran', 'India', 'Premium', 26),
(10, 'Anjali', 'India', 'Free', 23),
(11, 'Mike', 'USA', 'Premium', 28),
(12, 'Olivia', 'UK', 'Free', 24),
(13, 'Arjun', 'India', 'Premium', 25),
(14, 'Pooja', 'India', 'Free', 22),
(15, 'Chris', 'USA', 'Premium', 29),
(16, 'Lily', 'UK', 'Free', 21),
(17, 'Ravi', 'India', 'Premium', 26),
(18, 'Neha', 'India', 'Free', 23),
(19, 'Daniel', 'USA', 'Premium', 30),
(20, 'Sara', 'UK', 'Free', 22);

select * from users;

-- Insterting values into artists
INSERT INTO artists VALUES
(1, 'Arijit Singh', 'India', 50000000),
(2, 'Shreya Ghoshal', 'India', 40000000),
(3, 'Taylor Swift', 'USA', 90000000),
(4, 'Ed Sheeran', 'UK', 85000000),
(5, 'Atif Aslam', 'Pakistan', 30000000),
(6, 'Neha Kakkar', 'India', 35000000),
(7, 'Drake', 'USA', 80000000),
(8, 'Adele', 'UK', 70000000),
(9, 'Badshah', 'India', 45000000),
(10, 'Justin Bieber', 'Canada', 88000000),
(11, 'Armaan Malik', 'India', 25000000),
(12, 'Billie Eilish', 'USA', 60000000),
(13, 'Sid Sriram', 'India', 20000000),
(14, 'Rihanna', 'USA', 75000000),
(15, 'Kumar Sanu', 'India', 15000000),
(16, 'Shakira', 'Colombia', 65000000),
(17, 'Yo Yo Honey Singh', 'India', 30000000),
(18, 'Coldplay', 'UK', 72000000),
(19, 'Imagine Dragons', 'USA', 68000000),
(20, 'Bruno Mars', 'USA', 77000000);

select * from artists;

-- Insert Into songs
INSERT INTO songs VALUES
(1, 'Tum Hi Ho', 1, 250, 1000000),
(2, 'Sun Raha Hai', 2, 240, 900000),
(3, 'Blank Space', 3, 230, 1500000),
(4, 'Shape of You', 4, 260, 2000000),
(5, 'Jeene Laga Hoon', 5, 245, 800000),
(6, 'Kala Chashma', 6, 210, 1200000),
(7, 'Gods Plan', 7, 220, 1700000),
(8, 'Hello', 8, 300, 1600000),
(9, 'DJ Waley Babu', 9, 215, 1400000),
(10, 'Sorry', 10, 200, 1800000),
(11, 'Bol Do Na Zara', 11, 230, 700000),
(12, 'Bad Guy', 12, 190, 1300000),
(13, 'Adiye', 13, 210, 600000),
(14, 'Diamonds', 14, 250, 1100000),
(15, 'Tujhe Dekha', 15, 260, 500000),
(16, 'Waka Waka', 16, 230, 1400000),
(17, 'Blue Eyes', 17, 220, 1000000),
(18, 'Yellow', 18, 240, 1500000),
(19, 'Believer', 19, 210, 1600000),
(20, 'Grenade', 20, 230, 1700000);

select * from songs;

-- Insert values into plays
INSERT INTO plays VALUES
(1, 1, 1, '2024-01-01'),
(2, 2, 3, '2024-01-02'),
(3, 3, 4, '2024-01-03'),
(4, 4, 2, '2024-01-04'),
(5, 5, 5, '2024-01-05'),
(6, 6, 6, '2024-01-06'),
(7, 7, 7, '2024-01-07'),
(8, 8, 8, '2024-01-08'),
(9, 9, 9, '2024-01-09'),
(10, 10, 10, '2024-01-10'),
(11, 11, 11, '2024-01-11'),
(12, 12, 12, '2024-01-12'),
(13, 13, 13, '2024-01-13'),
(14, 14, 14, '2024-01-14'),
(15, 15, 15, '2024-01-15'),
(16, 16, 16, '2024-01-16'),
(17, 17, 17, '2024-01-17'),
(18, 18, 18, '2024-01-18'),
(19, 19, 19, '2024-01-19'),
(20, 20, 20, '2024-01-20'),
(21, 1, 4, '2024-02-01'),
(22, 2, 5, '2024-02-02'),
(23, 3, 6, '2024-02-03'),
(24, 4, 7, '2024-02-04');

select * from plays;
-- 1. Display all song titles along with their artist names. Use: INNER JOIN (songs ↔ artists)
SELECT s.title, a.artist_name
FROM songs s
INNER JOIN artists a 
ON s.artist_id = a.artist_id;
-- 2.Display song title, artist name, and artist country. Use: INNER JOIN (songs ↔ artists)
select s.title, a.artist_name, a.country
from songs s
Inner join artists a
on s.artist_id=a.artist_id;
-- 3.Show all users and the songs they played. Use: INNER JOIN (users ↔ plays ↔ songs)
select u.name,s.title
from users u
inner join  plays p
on u.user_id=p.user_id
inner join songs s
on p.song_id=s.song_id;

-- 4.Display user name, song title, and play_date. Use: INNER JOIN (users ↔ plays ↔ songs) 
select u.name, s.title, p.play_date
from users u
inner join plays p 
on u.user_id=p.user_id
inner join songs s
on s.song_id=p.play_id;

-- 5. Show all Premium users and the songs they played. Use: INNER JOIN (users ↔ plays ↔ songs)
select u.name,s.title
from users u
inner join plays p
on u.user_id=p.user_id
inner join songs s
on s.song_id=p.song_id
where u.subscription_type = 'Premium';

-- 6. Display artist name and total number of songs they have.Use: LEFT JOIN (artists ↔ songs)
SELECT a.artist_name, COUNT(s.song_id)
FROM artists a
LEFT JOIN songs s
ON a.artist_id = s.artist_id
GROUP BY a.artist_name;

-- 7. Show song title and how many times each song was played. Use: LEFT JOIN (songs ↔ plays)
SELECT s.title, COUNT(p.play_id) AS total_plays
FROM songs s
LEFT JOIN plays p
ON s.song_id = p.song_id
GROUP BY s.title;
-- 8.Display users who have not played any songs. Use: LEFT JOIN (users ↔ plays)
SELECT u.name
FROM users u
LEFT JOIN plays p
ON u.user_id = p.user_id
WHERE p.user_id IS NULL;