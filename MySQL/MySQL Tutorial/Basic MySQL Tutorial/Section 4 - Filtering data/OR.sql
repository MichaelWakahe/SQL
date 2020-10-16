-- Section 4. Filtering data
-- MySQL OR

-- SELECT (true OR false) AND false;

SELECT
	customername,
	country
FROM
	customers
WHERE country = 'USA' OR
      country = 'France';


SELECT
	customername,
	country,
	creditLimit
FROM
	customers
WHERE(country = 'USA'
		OR country = 'France')
	  AND creditlimit > 100000;


-- Notice that if you do not use the parentheses, the query will return the customers who locate in the USA or the
-- customers who locate in France with the credit limit greater than 10,000.
SELECT
	customername,
	country,
	creditLimit
FROM
	customers
WHERE country = 'USA'
		OR country = 'France'
		AND creditlimit > 10000;