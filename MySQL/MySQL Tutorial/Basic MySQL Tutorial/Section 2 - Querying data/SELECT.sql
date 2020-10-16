-- Section 2. Querying data

-- The SELECT statement allows you to read data from one or more tables. To write a SELECT statement in MySQL, you follow this syntax:
-- SELECT select_list FROM table_name;

SELECT lastName FROM classicmodels.employees;

SELECT
    lastname,
    firstname,
    jobtitle
FROM
    employees;

SELECT *
FROM employees;