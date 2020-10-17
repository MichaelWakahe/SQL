-- Section 5. Joining tables
-- MySQL LEFT JOIN

-- The following statement shows how to use the LEFT JOIN clause to join the two tables:
# SELECT
#     select_list
# FROM
#     t1
# LEFT JOIN t2 ON
#     join_condition;

SELECT
	customerNumber,
	customerName,
	orderNumber,
	status
FROM
	customers
LEFT JOIN orders USING (customerNumber);


-- Using MySQL LEFT JOIN clause to find unmatched rows
-- The LEFT JOIN clause is very useful when you want to find rows in a table that doesn’t have a matching row from
-- another table.

-- The following example uses the LEFT JOIN to find customers who have no order:

SELECT
    c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.status
FROM
    customers c
LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;


-- Condition in WHERE clause vs. ON clause
SELECT
    o.orderNumber,
    customerNumber,
    productCode
FROM
    orders o
LEFT JOIN orderdetails
    USING (orderNumber)
WHERE
    orderNumber = 10123;

-- the above is different from:
SELECT
    o.orderNumber,
    customerNumber,
    productCode
FROM
    orders o
LEFT JOIN orderdetails d
    ON o.orderNumber = d.orderNumber AND
       o.orderNumber = 10123;
-- In this case, the query returns all orders but only the order 10123 will have line items associated with it