--==================
-- PostgreSQL LIKE
--==================

-- You construct a pattern by combining literal values with wildcard characters and use the LIKE or NOT LIKE operator to
-- find the matches. PostgreSQL provides you with two wildcards:
--      Percent sign ( %) matches any sequence of zero or more characters.
--      Underscore sign ( _)  matches any single character.

-- The syntax of PostgreSQL LIKE operator is as follows:
--      value LIKE pattern

-- To negate the LIKE operator, you use the NOT operator as follows:
--      value NOT LIKE pattern

SELECT
	first_name,
    last_name
FROM
	myschema.customer
WHERE
	first_name LIKE 'Jen%';


SELECT
	'foo' LIKE 'foo', -- true
	'foo' LIKE 'f%', -- true
	'foo' LIKE '_o_', -- true
	'bar' LIKE 'b_'; -- false


-- The following query returns customers whose first name contains  er string like Jenifer, Kimberly, etc.
SELECT
	first_name,
    last_name
FROM
	myschema.customer
WHERE
	first_name LIKE '%er%'
ORDER BY
        first_name;


-- You can combine the percent ( %) with underscore ( _) to construct a pattern as the following example:
SELECT
	first_name,
	last_name
FROM
	myschema.customer
WHERE
	first_name LIKE '_her%'
ORDER BY
        first_name;


-- The following query uses the NOT LIKE operator to find customers whose first names do not begin with Jen:

SELECT
	first_name,
	last_name
FROM
	myschema.customer
WHERE
	first_name NOT LIKE 'Jen%'
ORDER BY
    first_name;


-- PostgreSQL supports the ILIKE operator that works like the LIKE operator. In addition, the ILIKE operator matches
-- value case-insensitively. For example:
SELECT
	first_name,
	last_name
FROM
	myschema.customer
WHERE
	first_name ILIKE 'BAR%';