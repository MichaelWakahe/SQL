--=======================
-- PostgreSQL INNER JOIN
--=======================
SELECT
	customer.customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	myschema.customer
INNER JOIN myschema.payment
    ON payment.customer_id = customer.customer_id
ORDER BY payment_date;


-- The following query returns the same result. However, it uses table aliases:
SELECT
	c.customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	myschema.customer c
INNER JOIN myschema.payment p
    ON p.customer_id = c.customer_id
WHERE
    c.customer_id = 2;

-- Since both tables have the same customer_id column, you can use the USING syntax:
SELECT
	customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	myschema.customer
INNER JOIN myschema.payment USING(customer_id)
ORDER BY payment_date;


-- INNER JOIN to join three tables
SELECT
	c.customer_id,
	c.first_name customer_first_name,
	c.last_name customer_last_name,
	s.first_name staff_first_name,
	s.last_name staff_last_name,
	amount,
	payment_date
FROM
	myschema.customer c
INNER JOIN myschema.payment p
    ON p.customer_id = c.customer_id
INNER JOIN myschema.staff s
    ON p.staff_id = s.staff_id
ORDER BY payment_date;
