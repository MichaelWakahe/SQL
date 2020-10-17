-- Section 6. Grouping data
-- MySQL ROLLUP

CREATE TABLE sales
SELECT
    productLine,
    YEAR(orderDate) orderYear,
    SUM(quantityOrdered * priceEach) orderValue
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
        INNER JOIN
    products USING (productCode)
GROUP BY
    productLine ,
    YEAR(orderDate);

SELECT
    *
FROM
    sales;


-- A grouping set is a set of columns to which you want to group. For example, the following query creates a grouping
-- set denoted by (productline)
SELECT
    productline,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline;

