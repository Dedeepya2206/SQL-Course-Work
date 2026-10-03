create database company;
use company;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE salary_grade (
    grade CHAR(1) PRIMARY KEY,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);

INSERT INTO employees (emp_id, emp_name, salary, dept_id, manager_id) VALUES
(1, 'Ravi', 50000, 10, 3),
(2, 'Priya', 60000, 20, 3),
(3, 'Kiran', 80000, 10, NULL),
(4, 'Anu', 45000, 30, 2),
(5, 'Suresh', 70000, NULL, 3),
(6, 'Divya', 55000, 20, 2);

INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance'),
(40, 'Sales');

SELECT * FROM employees;

INSERT INTO employees (emp_id, emp_name, salary, dept_id, manager_id)
VALUES (3, 'Kiran', 80000, 10, NULL);

INSERT INTO employees (emp_id, emp_name, salary, dept_id, manager_id) VALUES
(1, 'Ravi', 50000, 10, 3),
(2, 'Priya', 60000, 20, 3),
(5, 'Suresh', 70000, NULL, 3);
INSERT INTO employees (emp_id, emp_name, salary, dept_id, manager_id) VALUES
(4, 'Anu', 45000, 30, 2),
(6, 'Divya', 55000, 20, 2);
-- 1.Display employee names along with their department names using INNER JOIN.
select e.emp_name, d.dept_name
from departments d 
inner join employees e
on e.dept_id=d.dept_id;

-- 2. Display all employees along with their department names, including employees who are not assigned to any department. LEFT JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 3.Display all departments with their employees, including departments that have no employees. RIGHT JOIN
select d.dept_name, e.emp_name
from employees e
right join departments d
on d.dept_id=e.dept_id;
-- 4.Find employees who are not assigned to any department using LEFT JOIN. LEFT JOIN
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
-- 5. Find departments that do not have any employees using RIGHT JOIN. RIGHT JOIN
select d.dept_name
from employees e
right join departments d
on d.dept_id=e.dept_id
where e.dept_id is null ;
-- 6. Display all employees and all departments, including unmatched records from both tables, using FULL OUTER JOIN or a UNION of LEFT and RIGHT JOIN.
select e.emp_name, d.dept_name
from employees e 
left join departments d
on e.dept_id=d.dept_id
union
select e.emp_name,d.dept_name
from employees e 
right join departments d
on e.dept_id=d.dept_id;

-- 7. Display every possible combination of employees and departments using CROSS JOIN. CROSS JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;

-- 8. Display each employee's name along with their manager's name using SELF JOIN.
SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;

-- 9. Find pairs of employees who work in the same department, excluding pairs where an employee is matched with themselves. self join
SELECT 
    e1.emp_name AS employee1,
    e2.emp_name AS employee2,
    e1.dept_id
FROM employees e1
JOIN employees e2
ON e1.dept_id = e2.dept_id
AND e1.emp_id < e2.emp_id;

-- 10. Display employee names, salaries, and salary grades using a NON-EQUI JOIN.
SELECT e.emp_name, e.salary, s.grade
FROM employees e
JOIN salary_grade s
ON e.salary BETWEEN s.min_salary AND s.max_salary;

SELECT * FROM salary_grade;

INSERT INTO salary_grade (grade, min_salary, max_salary) VALUES
('C', 40000, 59999),
('B', 60000, 79999),
('A', 80000, 100000);
-- 11. Display employee names and department names using NATURAL JOIN.
SELECT e.emp_name, d.dept_name
FROM employees e
NATURAL JOIN departments d;
-- 12. Display employee names and department names for employees earning more than 50,000 using NATURAL JOIN.
select e.emp_name, d.dept_name
from employees e
natural join departments d

where e.salary>50000;
 -- 13.Display employee names, manager names, and department names using multiple joins.
SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager,
    d.dept_name AS department
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
-- 14.Display employees working in the IT department along with their salaries using INNER JOIN.
SELECT e.emp_name, e.salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';