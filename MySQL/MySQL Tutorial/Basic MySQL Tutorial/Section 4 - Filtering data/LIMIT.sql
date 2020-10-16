-- Section 4. Filtering data
-- MySQL LIMIT

# SELECT
#     select_list
# FROM
#     table_name
# LIMIT [offset,] row_count;

SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;


SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit
LIMIT 5;


-- In this example, the clause LIMIT 10, 10 returns 10 rows for the row 11 – 20.
SELECT
    customerNumber,
    customerName
FROM
    customers
ORDER BY customerName
LIMIT 10, 10;


# To get the nth highest or lowest value, you use the following LIMIT clause:
#
# SELECT select_list
# FROM table_name
# ORDER BY sort_expression
# LIMIT n-1, 1;
# The clause LIMIT n-1, 1 returns 1 row starting at the row n.
#
# For example, the following finds the customer who has the second-highest credit:
SELECT
    customerName,
    creditLimit
FROM
    customers
ORDER BY
    creditLimit DESC
LIMIT 1,1;