--===================
-- PostgreSQL Aliases
--===================
-- The following illustrates the syntax of a table alias:
--      table_name AS alias_name;

SELECT
	c.customer_id,
	first_name,
	amount,
	payment_date
FROM
	myschema.customer c
INNER JOIN myschema.payment p
    ON p.customer_id = c.customer_id
ORDER BY
   payment_date DESC;


-- Aliases for a self join:
SELECT
    e.first_name employee,
    m .first_name manager
FROM
    employee e
INNER JOIN employee m
    ON m.employee_id = e.manager_id
ORDER BY manager;

