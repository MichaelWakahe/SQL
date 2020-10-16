-- Section 4. Filtering data
-- MySQL DISTINCT

-- When querying data from a table, you may get duplicate rows. In order to remove these duplicate rows, you use the
-- DISTINCT clause in the SELECT statement.

-- Here is the syntax of the DISTINCT clause:

# SELECT DISTINCT
#     select_list
# FROM
#     table_name;

SELECT
    lastname
FROM
    employees
ORDER BY
    lastname;

SELECT
    DISTINCT lastname
FROM
    employees
ORDER BY
    lastname;


-- If a column has NULL values and you use the DISTINCT clause for that column, MySQL keeps only one NULL value because
-- DISTINCT treats all NULL values as the same value.
SELECT state
FROM customers;

SELECT DISTINCT state
FROM customers;


-- MySQL DISTINCT with multiple columns
SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY
    state,
    city;


-- DISTINCT clause vs. GROUP BY clause
-- If you use the GROUP BY clause in the SELECT statement without using aggregate functions, the GROUP BY clause behaves
-- like the DISTINCT clause.
SELECT
    state
FROM
    customers
GROUP BY state;

-- You can achieve a similar result by using the DISTINCT clause:
SELECT DISTINCT
    state
FROM
    customers;

-- Generally speaking, the DISTINCT clause is a special case of the GROUP BY clause. The difference between DISTINCT
-- clause and GROUP BY clause is that the GROUP BY clause sorts the result set whereas the DISTINCT clause does not.

-- If you add the ORDER BY clause to the statement that uses the  DISTINCT clause, the result set is sorted and it is
-- the same as the one returned by the statement that uses GROUP BY clause.

SELECT DISTINCT
    state
FROM
    customers
ORDER BY
    state;


-- MySQL DISTINCT and aggregate functions
-- You can use the DISTINCT clause with an aggregate function e.g., SUM, AVG, and COUNT, to remove duplicate rows before
-- the aggregate functions are applied to the result set.
SELECT
    COUNT(DISTINCT state)
FROM
    customers
WHERE
    country = 'USA';


-- MySQL DISTINCT with LIMIT clause
SELECT DISTINCT
    state
FROM
    customers
WHERE
    state IS NOT NULL
LIMIT 5;