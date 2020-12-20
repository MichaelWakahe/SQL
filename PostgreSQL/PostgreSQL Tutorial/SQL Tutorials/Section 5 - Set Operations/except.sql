--======================
-- PostgreSQL EXCEPT
--======================
-- Like the UNION and INTERSECT operators, the EXCEPT operator returns rows by comparing the result sets of two or more
-- queries. The EXCEPT operator returns distinct rows from the first (left) query that are not in the output of the
-- second (right) query.

-- The following illustrates the syntax of the EXCEPT operator.
    -- SELECT select_list
    -- FROM A
    -- EXCEPT
    -- SELECT select_list
    -- FROM B;

SELECT * FROM top_rated_films
EXCEPT
SELECT * FROM most_popular_films;


-- The following statement uses the ORDER BY clause in the query to sort result sets returned by the EXCEPT operator:
SELECT * FROM top_rated_films
EXCEPT
SELECT * FROM most_popular_films
ORDER BY title;