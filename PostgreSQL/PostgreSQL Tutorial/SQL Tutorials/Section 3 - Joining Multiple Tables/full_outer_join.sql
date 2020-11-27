--===========================
-- PostgreSQL FULL OUTER JOIN
--===========================

-- Suppose that you want to perform a full outer join of two tables: A and B. The following illustrates the syntax of
-- the FULL OUTER JOIN:
SELECT * FROM A
FULL [OUTER] JOIN B on A.id = B.id;
-- In this syntax, the OUTER keyword is optional.
-- The full outer join combines the results of both left join and right join.


-- Create two new tables for the demonstration: employees and departments:
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE departments (
	department_id serial PRIMARY KEY,
	department_name VARCHAR (255) NOT NULL
);

CREATE TABLE employees (
	employee_id serial PRIMARY KEY,
	employee_name VARCHAR (255),
	department_id INTEGER
);

INSERT INTO departments (department_name)
VALUES
	('Sales'),
	('Marketing'),
	('HR'),
	('IT'),
	('Production');

INSERT INTO employees (
	employee_name,
	department_id
)
VALUES
	('Bette Nicholson', 1),
	('Christian Gable', 1),
	('Joe Swank', 2),
	('Fred Costner', 3),
	('Sandra Kilmer', 4),
	('Julia Mcqueen', NULL);


-- Use the FULL OUTER JOIN to query data from both employees and departments tables.
SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d
        ON d.department_id = e.department_id;


-- To find the department that does not have any employees, you use a WHERE clause as follows:
SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d
        ON d.department_id = e.department_id
WHERE
	employee_name IS NULL;


-- To find the employee who does not belong to any department, you check for the NULL of the department_name in the
-- WHERE clause as the following statement:
SELECT
	employee_name,
	department_name
FROM
	employees e
FULL OUTER JOIN departments d ON d.department_id = e.department_id
WHERE
	department_name IS NULL;