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
