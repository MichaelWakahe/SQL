--==================
-- PostgreSQL IN
--==================
-- You use IN operator in the WHERE clause to check if a value matches any value in a list of values.
-- The syntax of the IN operator is as follows:
--      value IN (value1,value2,...)

SELECT
	customer_id,
	rental_id,
	return_date
FROM
	myschema.rental
WHERE
	customer_id IN (1, 2)
ORDER BY
	return_date DESC;

-- The following is equivalent to the query above:
SELECT
    customer_id,
	rental_id,
	return_date
FROM
	myschema.rental
WHERE
	customer_id = 1 OR customer_id = 2
ORDER BY
	return_date DESC;


-- You can combine the IN operator with the NOT operator to select rows whose values do not match the values in the
-- list.
SELECT
	customer_id,
	rental_id,
	return_date
FROM
	myschema.rental
WHERE
	customer_id NOT IN (1, 2);


-- Similar to the IN operator, you can use the not equal (<>) and AND operators to write the NOT IN operator:
SELECT
	customer_id,
	rental_id,
	return_date
FROM
	myschema.rental
WHERE
	customer_id <> 1
AND customer_id <> 2;


-- PostgreSQL IN with a subquery
SELECT
	customer_id,
	first_name,
	last_name
FROM
	myschema.customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM myschema.rental
		WHERE CAST (return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;