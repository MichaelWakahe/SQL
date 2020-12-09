--=========================
-- PostgreSQL GROUP BY
--========================
-- The following statement illustrates the basic syntax of the GROUP BY clause:
-- SELECT
--    column_1,
--    column_2,
--    ...,
--    aggregate_function(column_3)
-- FROM
--    table_name
-- GROUP BY
--    column_1,
--    column_2,
--    ...;

-- PostgreSQL evaluates the GROUP BY clause after the FROM and WHERE clauses and before the HAVING SELECT, DISTINCT, ORDER
-- BY and LIMIT clauses.


-- You can use the GROUP BY clause without applying an aggregate function. The following query gets data from the
-- payment table and groups the result by customer id. In this case, the GROUP BY works like the DISTINCT clause that
-- removes duplicate rows from the result set.
SELECT
   customer_id
FROM
   myschema.payment
GROUP BY
   customer_id;


-- The following query uses the GROUP BY clause to get total amount that each customer has been paid:
SELECT
	customer_id,
	SUM (amount)
FROM
	myschema.payment
GROUP BY
	customer_id;


-- The following statement uses the ORDER BY clause with GROUP BY clause to sort the groups:
SELECT
	customer_id,
	SUM (amount)
FROM
	myschema.payment
GROUP BY
	customer_id
ORDER BY
	SUM (amount) DESC;


-- Using PostgreSQL GROUP BY clause with the JOIN clause
-- This query joins the payment table with the customer table and group customers by their names.
SELECT
	customer.first_name || ' ' || customer.last_name full_name,
	SUM (payment.amount) amount
FROM
	myschema.payment
INNER JOIN myschema.customer USING (customer_id)
GROUP BY
	full_name
ORDER BY amount;


-- To find the number of payment transactions that each staff has been processed
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	myschema.payment
GROUP BY
	staff_id;


-- In this example, the GROUP BY clause divides the rows in the payment table by the values in the customer_id and
-- staff_id columns. For each group of (customer_id, staff_id), the SUM() calculates the total amount.
SELECT
	customer_id,
	staff_id,
	SUM(amount)
FROM
	myschema.payment
GROUP BY
	staff_id,
	customer_id
ORDER BY
    customer_id;


-- The payment_date is a timestamp column. To group payments by dates, you use the DATE() function to convert timestamps
-- to dates first and then group payments by the result date:
SELECT
	DATE(payment_date) paid_date,
	SUM(amount) sum
FROM
	myschema.payment
GROUP BY
	paid_date;

