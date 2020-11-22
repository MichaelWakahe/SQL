--====================
-- PostgreSQL BETWEEN
--====================
-- You use the BETWEEN operator to match a value against a range of values. The following illustrates the syntax of the
-- BETWEEN operator:
--      value BETWEEN low AND high;

-- You can rewrite the BETWEEN operator by using the greater than or equal ( >=) or less than or equal ( <=) operators
-- like this:
--      value >= low and value <= high

-- If you want to check if a value is out of a range, you combine the NOT operator with the BETWEEN operator as follows:
-- value NOT BETWEEN low AND high;

-- The following expression is equivalent to the expression that uses the NOT and BETWEEN operators:
-- value < low OR value > high

SELECT
	customer_id,
	payment_id,
	amount
FROM
	myschema.payment
WHERE
	amount BETWEEN 8 AND 9;

SELECT
	customer_id,
	payment_id,
	amount
FROM
	myschema.payment
WHERE
	amount NOT BETWEEN 8 AND 9;


-- If you want to check a value against of date ranges, you should use the literal date in ISO 8601 format i.e.,
-- YYYY-MM-DD.
SELECT
	customer_id,
	payment_id,
	amount,
 payment_date
FROM
	myschema.payment
WHERE
	payment_date BETWEEN '2007-02-07' AND '2007-02-15';