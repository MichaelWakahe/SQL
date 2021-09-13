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


-- Below are examples of the MySQL SELECT statement without referencing any table.
-- You can have a SELECT statement without the FROM clause like this:
-- SELECT select_list;

SELECT 1 + 1;

-- returns the current date and time of the MySQL server:
SELECT NOW();


-- The NOW() function doesn’t have any parameters. To call it, you place the parentheses () after the function name.
-- If a function has parameters, you need to pass arguments into it. For example, concatenate strings into one string,
-- you can use the CONCAT() function:
SELECT CONCAT('John',' ','Doe');


-- Sometimes, you still need to use the FROM clause but you don’t want to reference any actual table. In this case, you
-- can use the dual table in the FROM clause:
SELECT 'a' FROM dual;


--==========================================
-- A quick introduction to the column alias
--==========================================
-- SELECT expression AS column_alias;
SELECT CONCAT('John',' ','Doe') AS name;

-- If the column alias contains spaces, you need to place it inside quotes like this:
SELECT CONCAT('Jane',' ','Doe') AS 'Full name';