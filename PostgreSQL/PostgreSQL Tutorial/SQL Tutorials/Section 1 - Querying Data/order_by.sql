--=====================
-- PostgreSQL ORDER BY
--=====================

-- The result set returned from the SELECT statement can be ordered by using the PostgreSQL ORDER BY clause.
SELECT
 first_name,
 last_name
FROM
 myschema.customer
ORDER BY
 first_name ASC;


-- If you want to sort the customers by the last name in descending order, you can use the DESC keyword
SELECT
   first_name,
   last_name
FROM
   myschema.customer
ORDER BY
   last_name DESC;


-- If you want to sort the customers by the first name in the ascending order first, and then sort the sorted result set
-- by the last name in descending order
SELECT
    first_name,
    last_name
FROM
    myschema.customer
ORDER BY
    first_name ASC,
    last_name DESC;


-- When you sort rows that contains NULL, you can specify the order of NULL with other non-null values by using the NULLS FIRST or NULLS LAST option of the ORDER BY clause:

-- create a new table
CREATE TABLE sort_demo(
	num INT
);

-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

SELECT num
FROM sort_demo
ORDER BY num NULLS LAST;


-- To place NULL before other non-null values, you use the NULLS FIRST option:
SELECT num
FROM sort_demo
ORDER BY num NULLS FIRST;


-- The following statement sorts values in the num column of the sort_demo table in descending order:
SELECT num
FROM sort_demo
ORDER BY num DESC;


-- To reverse the order, you can use the NULLS LAST option:
SELECT num
FROM sort_demo
ORDER BY num DESC NULLS LAST;
