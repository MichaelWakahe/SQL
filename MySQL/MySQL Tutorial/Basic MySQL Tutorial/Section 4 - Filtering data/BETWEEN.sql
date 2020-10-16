-- Section 4. Filtering data
-- MySQL BETWEEN

-- expr [NOT] BETWEEN begin_expr AND end_expr;
-- All three expressions:  `expr`,  `begin_expr`, and  `end_expr` must have the same data type.

SELECT
    productCode,
    productName,
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;

-- This query uses the greater than or equal (>=) and less than or equal ( <= ) operators instead of the BETWEEN
-- operator to get the same result:

SELECT
    productCode,
    productName,
    buyPrice
FROM
    products
WHERE
    buyPrice >= 90 AND buyPrice <= 100;


SELECT
    productCode,
    productName,
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;


-- You can rewrite the query above using the less than (<), greater than (>), and logical operators ( AND) as the
-- following query:
SELECT
    productCode,
    productName,
    buyPrice
FROM
    products
WHERE
    buyPrice < 20 OR buyPrice > 100;


-- Using MySQL BETWEEN with dates example
SELECT
   orderNumber,
   requiredDate,
   status
FROM
   orders
WHERE
   requireddate BETWEEN
     CAST('2003-01-01' AS DATE) AND
     CAST('2003-01-31' AS DATE);