-- Section 5. Joining tables
-- MySQL INNER JOIN

-- The INNER JOIN is an optional clause of the SELECT statement. It appears immediately after the FROM clause. Here is
-- the syntax of the INNER JOIN clause:
# SELECT
#     select_list
# FROM t1
# INNER JOIN t2 ON join_condition1
# INNER JOIN t3 ON join_condition2
# ...;

-- Suppose you want to get:
--    The productCode and productName from the products table.
--    The textDescription of product lines from the productlines table.
-- To do this, you need to select data from both tables by matching rows based on values in the productline column using
-- the INNER JOIN clause as follows:
SELECT
    productCode,
    productName,
    textDescription
FROM
    products t1
INNER JOIN productlines t2
    ON t1.productline = t2.productline;

-- Because the joined columns of both tables have the same name  productline, you can use the USING syntax:
SELECT
    productCode,
    productName,
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);


-- This query returns order number, order status and total sales from the orders and orderdetails tables using the INNER
-- JOIN clause with the GROUP BY clause:
SELECT
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

-- alternatively:
SELECT
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2
    USING (orderNumber)
GROUP BY orderNumber;


-- join three tables example
-- This query uses two INNER JOIN clauses to join three tables: orders, orderdetails, and products:
SELECT
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY
    orderNumber,
    orderLineNumber;

-- alternatively:
SELECT
    o.orderNumber,
    o.orderDate,
    od.orderLineNumber,
    p.productName,
    od.quantityOrdered,
    od.priceEach
FROM
    orders o
INNER JOIN
    orderdetails od USING (orderNumber)
INNER JOIN
    products p USING (productCode)
ORDER BY
    o.orderNumber,
    od.orderLineNumber;


-- MySQL INNER JOIN using other operators
SELECT
    o.orderNumber,
    p.productName,
    p.msrp,
    o.priceEach
FROM
    products p
INNER JOIN orderdetails o
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';