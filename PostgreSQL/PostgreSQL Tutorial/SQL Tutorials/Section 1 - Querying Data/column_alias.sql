-- A column alias allows you to assign a column or an expression in the select list of a SELECT statement a temporary
-- name. The column alias exists temporarily during the execution of the query.

SELECT
   first_name,
   last_name AS surname
FROM myschema.customer;


-- Or you can make it shorter by removing the AS keyword as follows:
SELECT
   first_name,
   last_name surname
FROM myschema.customer;


-- Note that in PostgreSQL, you use the || as the concatenating operator that concatenates one or more strings into a single string.
SELECT
   first_name || ' ' || last_name AS full_name
FROM
   myschema.customer;


-- If a column alias contains one or more spaces, you need to surround it with double quotes
SELECT
    first_name || ' ' || last_name "full name"
FROM
    myschema.customer;