-- basic select
SELECT
 *
FROM
 customer;
 
SELECT
 first_name,
 last_name,
 email
FROM
 customer;
 

-- The result set returned from the SELECT statement can be ordered by using the PostgreSQL ORDER BY clause.
SELECT
 first_name,
 last_name
FROM
 customer
ORDER BY
 first_name ASC;
 
SELECT
   first_name,
   last_name
FROM
   customer
ORDER BY
   last_name DESC;
 
SELECT
 first_name,
 last_name
FROM
 customer
ORDER BY
 first_name ASC,
 last_name DESC;
 

-- PostgreSQL SELECT DISTINCT clause to remove duplicate rows from a result set returned by a query
CREATE TABLE public.t1 (
 id serial NOT NULL PRIMARY KEY,
 bcolor VARCHAR,
 fcolor VARCHAR
);


INSERT INTO public.t1 (bcolor, fcolor)
VALUES
 ('red', 'red'),
 ('red', 'red'),
 ('red', NULL),
 (NULL, 'red'),
 ('red', 'green'),
 ('red', 'blue'),
 ('green', 'red'),
 ('green', 'blue'),
 ('green', 'green'),
 ('blue', 'red'),
 ('blue', 'green'),
 ('blue', 'blue');
 
SELECT
 id,
 bcolor,
 fcolor
FROM
 t1;
 
SELECT
 DISTINCT bcolor
FROM
 t1
ORDER BY
 bcolor;
 

-- If you specify multiple columns, the DISTINCT clause will evaluate the duplicate based on the combination of values of these columns.
SELECT
 DISTINCT bcolor,
 fcolor
FROM
 t1
ORDER BY
 bcolor ASC,
 fcolor DESC;
 
-- The following statement sorts the result set by the  bcolor and  fcolor, and then for each group of duplicates, 
-- it keeps the first row in the returned result set.
SELECT
 DISTINCT ON
 (bcolor) bcolor,
 fcolor
FROM
 t1
ORDER BY
 bcolor ASC,
 fcolor ASC;