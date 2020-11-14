--==================
-- PostgreSQL WHERE
--==================

-- Using WHERE clause with the equal (=) operator example
SELECT
   last_name,
   first_name
FROM
   myschema.customer
WHERE
   first_name = 'Jamie';


-- Using WHERE clause with the AND operator example
SELECT
   last_name,
   first_name
FROM
   myschema.customer
WHERE
   first_name = 'Jamie' AND
   last_name = 'Rice';


-- Using WHERE clause with the OR operator example
SELECT
   first_name,
   last_name
FROM
   myschema.customer
WHERE
   last_name = 'Rodriguez' OR
   first_name = 'Adam';


-- Using WHERE clause with the IN operator example
SELECT
   first_name,
   last_name
FROM
   myschema.customer
WHERE
   first_name IN ('Ann','Anne','Annie');


-- Using WHERE clause with the LIKE operator example
SELECT
   first_name,
   last_name
FROM
   myschema.customer
WHERE
   first_name LIKE 'Ann%'


-- Using WHERE clause with the BETWEEN operator example
SELECT
   first_name,
   LENGTH(first_name) name_length
FROM
   myschema.customer
WHERE
   first_name LIKE 'A%' AND
   LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
   name_length;


-- Using WHERE clause with the not equal operator (<>) example
-- Note that you can use the != operator instead of <> operator. They have the same effect.
SELECT
   first_name,
   last_name
FROM
   customer
WHERE
   first_name LIKE 'Bra%' AND
   last_name <> 'Motley';

