-- Section 5. Joining tables
-- MySQL ALIAS

-- Sometimes, column names are so technical that make the query’s output very difficult to understand. To give a column
-- a descriptive name, you can use a column alias.
# SELECT
#    [column_1 | expression] AS descriptive_name
# FROM table_name;

-- If the alias contains spaces, you must quote it as the following:
# SELECT
#    [column_1 | expression] AS `descriptive name`
# FROM
#    table_name;

-- Because the AS keyword is optional, you can omit it in the statement.

-- -------------------------
-- MySQL alias for columns
-- -------------------------
SELECT
   CONCAT_WS(', ', lastName, firstname) AS `Full name`
FROM
   employees;


-- You can use the column alias in the ORDER BY, GROUP BY and HAVINGclauses to refer to the column.
SELECT
	CONCAT_WS(', ', lastName, firstname) `Full name`
FROM
	employees
ORDER BY
	`Full name`;


SELECT
	orderNumber `Order no.`,
	SUM(priceEach * quantityOrdered) total
FROM
	orderdetails
GROUP BY
	`Order no.`
HAVING
	total > 60000;


-- -------------------------
-- MySQL alias for tables
-- -------------------------
# table_name AS table_alias
# The alias for a table is called table alias. Like the column alias, the AS keyword is optional so you can omit it.

SELECT
    e.firstName,
    e.lastName
FROM
    employees e
ORDER BY e.firstName;


SELECT
	customerName,
	COUNT(o.orderNumber) total
FROM
	customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY
	customerName
ORDER BY
	total DESC;

-- If you do not use the alias in the query above, you have to use the table name to refer to its columns, which makes
-- the query lengthy and less readable as the following:
SELECT
	customers.customerName,
	COUNT(orders.orderNumber) total
FROM
	customers
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
GROUP BY
	customerName
ORDER BY
	total DESC