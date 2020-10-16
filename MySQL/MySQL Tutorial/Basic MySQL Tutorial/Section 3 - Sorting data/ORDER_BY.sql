-- Section 3. Sorting data

-- When you use the SELECT statement to query data from a table, the result set is not sorted. It means that the rows in
-- the result set can be in any order.
-- To sort the result set, you add the ORDER BY clause to the SELECT statement.

-- The following illustrates the syntax of the ORDER BY  clause:
# SELECT
#    select_list
# FROM
#    table_name
# ORDER BY
#    column1 [ASC|DESC],
#    column2 [ASC|DESC],
#    ...;

SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname;


SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;


SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC,
	contactFirstname ASC;


--  Using MySQL ORDER BY to sort a result set by an expression example
SELECT
    orderNumber,
    orderlinenumber,
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY
   quantityOrdered * priceEach DESC;


-- To make the query more readable, you can assign the expression in the SELECT clause a column alias and use that
-- column alias in the ORDER BY clause as shown in the following query:
SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;


-- The ORDER BY  clause allows you to sort data using a custom list by using the FIELD()  function.
SELECT
    orderNumber,
    status
FROM
    orders
ORDER BY
    FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');