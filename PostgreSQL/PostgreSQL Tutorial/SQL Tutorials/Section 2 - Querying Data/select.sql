--===================
-- PostgreSQL SELECT
--===================
-- Using SELECT statement to query data from one column example
SELECT
   first_name
FROM
   myschema.customer;


-- Using SELECT statement to query data from multiple columns example
SELECT
 first_name,
 last_name,
 email
FROM
 myschema.customer;


-- Using SELECT statement to query data in all columns of a table example
SELECT
   *
FROM
   myschema.customer;


-- Using SELECT statement with expressions example
-- The following example uses the SELECT statement to return the full names and emails of all customers:
SELECT
   first_name || ' ' || last_name AS full_name,
   email
FROM
   myschema.customer;


-- Using SELECT statement with  only expressions example
SELECT 5 * 3 AS result;
