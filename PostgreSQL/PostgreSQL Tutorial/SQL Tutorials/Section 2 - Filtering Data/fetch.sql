--==================
-- PostgreSQL FETCH
--==================
-- The LIMIT clause is not a SQL-standard.
-- To conform with the SQL standard, PostgreSQL supports the FETCH clause to retrieve a number of rows returned by a
-- query. Note that the FETCH clause was introduced in SQL:2008.

-- The following illustrates the syntax of the PostgreSQL FETCH clause:
-- OFFSET start { ROW | ROWS }
-- FETCH { FIRST | NEXT } [ row_count ] { ROW | ROWS } ONLY

-- In this syntax:

-- ROW is the synonym for ROWS, FIRST is the synonym for NEXT . SO you can use them interchangeably
-- The start is an integer that must be zero or positive. By default, it is zero if the OFFSET clause is not specified.
--      In case the start is greater than the number of rows in the result set, no rows are returned;
-- The row_count is 1 or greater. By default, the default value of row_count is 1 if you do not specify it explicitly.

SELECT
    film_id,
    title
FROM
    myschema.film
ORDER BY
    title
FETCH FIRST ROW ONLY;

-- It is equivalent to the following query:
SELECT
    film_id,
    title
FROM
    myschema.film
ORDER BY
    title
FETCH FIRST 1 ROW ONLY;


-- The following query use the FETCH clause to select the first five films sorted by titles:
SELECT
    film_id,
    title
FROM
    myschema.film
ORDER BY
    title
FETCH FIRST 5 ROW ONLY;


-- The following statement returns the next five films after the first five films sorted by titles:
SELECT
    film_id,
    title
FROM
    myschema.film
ORDER BY
    title
OFFSET 5 ROWS
FETCH FIRST 5 ROW ONLY;