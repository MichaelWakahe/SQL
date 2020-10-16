-- Section 4. Filtering data
-- MySQL AND

-- Note that in MySQL, zero is considered false and non-zero is treated as true.

SELECT
    customername,
    country,
    state
FROM
    customers
WHERE
    country = 'USA' AND state = 'CA';


SELECT
	customername,
	country,
	state,
	creditlimit
FROM
	customers
WHERE country = 'USA'
	AND state = 'CA'
	AND creditlimit > 100000;