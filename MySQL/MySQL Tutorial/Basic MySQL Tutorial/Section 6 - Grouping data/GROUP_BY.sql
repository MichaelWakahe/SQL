-- Section 6. Grouping data
-- MySQL GROUP BY

-- The GROUP BY clause returns one row for each group. In other words, it reduces the number of rows in the result set.

-- You often use the GROUP BY clause with aggregate functions such as SUM, AVG, MAX, MIN, and COUNT. The aggregate
-- function that appears in the SELECT clause provides information about each group.

-- The GROUP BY clause is an optional clause of the SELECT statement. The following illustrates the GROUP BY clause
-- syntax:
# SELECT
#     c1, c2,..., cn, aggregate_function(ci)
# FROM
#     table
# WHERE
#     where_conditions
# GROUP BY c1 , c2,...,cn;

SELECT
    status
FROM
    orders
GROUP BY status;

-- alternative to the above:
SELECT DISTINCT
    status
FROM
    orders;


-- Using MySQL GROUP BY with aggregate functions
SELECT
    status, COUNT(*)
FROM
    orders
GROUP BY status;


-- To get the total amount of all orders by status
SELECT
    o.status,
    SUM(od.quantityOrdered * od.priceEach) AS amount
FROM
    orders o
INNER JOIN orderdetails od
    USING (orderNumber)
GROUP BY
    o.status;


-- Similarly, the following query returns the order numbers and the total amount of each order.
SELECT
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY
    orderNumber;


-- MySQL GROUP BY with expression example
-- In addition to columns, you can group rows by expressions. The following query gets the total sales for each year.
SELECT
    YEAR(orderDate) AS year,
    SUM(od.quantityOrdered * od.priceEach) AS total
FROM
    orders o
INNER JOIN orderdetails od
    USING (orderNumber)
WHERE
    o.status = 'Shipped'
GROUP BY
    year; -- Standard SQL does not allow you to use an alias in the GROUP BY clause, however, MySQL supports this.


-- Using MySQL GROUP BY with HAVING clause example
-- To filter the groups returned by GROUP BY clause, you use a  HAVING clause. The following query uses the HAVING
-- clause to select the total sales of the years after 2003.
SELECT
    YEAR(orderDate) AS year,
    SUM(od.quantityOrdered * od.priceEach) AS total
FROM
    orders o
INNER JOIN orderdetails od
    USING (orderNumber)
WHERE
    o.status = 'Shipped'
GROUP BY
    year
HAVING
    year > 2003;


SELECT
    status,
    COUNT(*)
FROM
    orders
GROUP BY
    status DESC; -- MySQL also allows you to sort the groups in ascending or descending orders while the standard SQL
                 -- does not.