-- Transactiom
-- group of transactions

-- step1 : Create Database
CREATE DATABASE IF NOT EXISTS BankDB;
USE BankDB;

-- step2: Create Table
CREATE TABLE Accounts (
  Acc_No INT PRIMARY KEY,
  NAME VARCHAR(50),
  Balance DECIMAL (10,2)
);

-- Step 3: Insert Sample Data
INSERT INTO  Accounts VALUES
    (101, 'Arjun', 15000.00),
    (102, 'Priya', 10000.00);

-- check Initial Data
SELECT * from Accounts;

SELECT @@autocommit;
-- update the autocommit
SET autocommit = 0;


START TRANSACTION;
-- Deduct 5000 from arjun
UPDATE Accounts
SET Balance = Balance - 5000
WHERE Acc_No = 101;

-- Add 5000 to priya
UPDATE Accounts
SET Balance = Balance + 5000
WHERE Acc_No = 102;

-- Saves Changes Permanently
COMMIT;

START TRANSACTION;
-- Debut 2000 from Arjun
UPDATE Accounts
SET Balance = Balance - 2000
WHERE Acc_No = 101;

-- check before rollback
SELECT * FROM Accounts;
-- Cancel Transaction
ROLLBACK;
-- Check After Rollback (Balanced should be unchanged
-- Example 3: Debut 1000
UPDATE Accounts
SET Balance = Balance - 1000
WHERE Acc_No = 101;
SELECT *FROM Accounts;
 -- CREATE SAVEPOINT
 SAVEPOINT after_deduction;
-- step2:add 1000
 UPDATE Accounts
 SET Balance = Balance + 1000
 WHERE ACC_NO = 102;

SELECT * FROM Accounts;

-- suppose something goes wrong
-- rollback only to savepoint
rollback to after_deduction;

-- final commit
COMMIT;

-- final data check
SELECT * FROM Accounts;

 








