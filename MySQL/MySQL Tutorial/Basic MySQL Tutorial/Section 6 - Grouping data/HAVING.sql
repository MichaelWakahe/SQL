-- Section 6. Grouping data
-- MySQL HAVING

-- The  HAVING clause is used in the SELECT statement to specify filter conditions for a group of rows or aggregates.

-- The HAVING clause is often used with the GROUP BY clause to filter groups based on a specified condition. If the
-- GROUP BY clause is omitted, the HAVING clause behaves like the WHERE clause.

-- The following illustrates the syntax of the HAVING clause:
# SELECT
#     select_list
# FROM
#     table_name
# WHERE
#     search_condition
# GROUP BY
#     group_by_expression
# HAVING
#     group_condition;

SELECT
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber;

SELECT
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY
   ordernumber
HAVING
   total > 5000;


-- You can construct a complex condition in the HAVING clause using logical operators such as OR and AND.
SELECT
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach * quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING
    total > 1000 AND
    itemsCount > 600;


-- Suppose that you want to find all orders that are in shipped status and have the total amount greater than 1500
SELECT
    a.ordernumber,
    status,
    SUM(priceeach * quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b
    ON b.ordernumber = a.ordernumber
GROUP BY
    ordernumber,
    status
HAVING
    status = 'Shipped' AND
    total > 1500;

-- An alternative to the above:
SELECT
    a.ordernumber,
    status,
    SUM(priceeach * quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b
    ON b.ordernumber = a.ordernumber
WHERE
	status = 'Shipped'
GROUP BY
    ordernumber,
    status
HAVING
    total > 1500;