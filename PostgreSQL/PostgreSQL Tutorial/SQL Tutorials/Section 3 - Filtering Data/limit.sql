--==================
-- PostgreSQL LIMIT
--==================

-- This example uses the LIMIT clause to get the first 5 films ordered by film_id:
SELECT
   film_id,
   title,
   release_year
FROM
   film
ORDER BY
   film_id
LIMIT 5;


-- To retrieve 4 films starting from the third one ordered by film_id, you use both LIMIT and OFFSET clauses as follows
SELECT
   film_id,
   title,
   release_year
FROM
   film
ORDER BY
   film_id
LIMIT 4 OFFSET 3;
