--===================
-- PostgreSQL HAVING
--===================
-- The HAVING clause specifies a search condition for a group or an aggregate. The HAVING clause is often used with the
-- GROUP BY clause to filter groups or aggregates based on a specified condition.
--
-- The following statement illustrates the basic syntax of the HAVING clause:
--
-- SELECT
-- 	    column1,
-- 	    aggregate_function (column2)
-- FROM
-- 	    table_name
-- GROUP BY
-- 	    column1
-- HAVING
-- 	    condition;

-- Since the HAVING clause is evaluated before the SELECT clause, you cannot use column aliases in the HAVING clause.
-- Because at the time of evaluating the HAVING clause, the column aliases specified in the SELECT clause are not
-- available.

-- HAVING vs. WHERE
-- The WHERE clause allows you to filter rows based on a specified condition. However, the HAVING clause allows you to
-- filter groups of rows according to a specified condition. In other words, the WHERE clause is applied to rows while
-- the HAVING clause is applied to groups of rows.


-- The following statement adds the HAVING clause to select the only customers who have been spending more than 200:
SELECT
	customer_id,
	SUM (amount)
FROM
	myschema.payment
GROUP BY
	customer_id
HAVING
	SUM (amount) > 200;


-- The following statement adds the HAVING clause to select the store that has more than 300 customers:
SELECT
	store_id,
	COUNT (customer_id)
FROM
	myschema.customer
GROUP BY
	store_id
HAVING
	COUNT (customer_id) > 300;


-- The following SQL query WON'T work (SELECT is evaluated after HAVING):
SELECT
	store_id,
	COUNT (customer_id) as cust_count
FROM
	myschema.customer
GROUP BY
	store_id
HAVING
	cust_count > 300;