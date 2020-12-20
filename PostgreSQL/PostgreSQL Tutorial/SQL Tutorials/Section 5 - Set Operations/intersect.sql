--======================
-- PostgreSQL INTERSECT
--======================
-- Like the UNION and EXCEPT operators, the PostgreSQL INTERSECT operator combines result sets of two or more SELECT
-- statements into a single result set.
-- The INTERSECT operator returns any rows that are available in both result sets.

-- The following illustrates the syntax of the INTERSECT operator:
    -- SELECT select_list
    -- FROM A
    -- INTERSECT
    -- SELECT select_list
    -- FROM B;

-- To use the INTERSECT operator, the columns that appear in the SELECT statements must follow the folowing rules:
--      * The number of columns and their order in the SELECT clauses must be the same.
--      * The data types of the columns must be compatible.


-- If you want to sort the result set returned by the INTERSECT operator, you place the ORDER BY at the final query in
-- the query list like this:
    -- SELECT select_list
    -- FROM A
    -- INTERSECT
    -- SELECT select_list
    -- FROM B
    -- ORDER BY sort_expression;


SELECT *
FROM most_popular_films
INTERSECT
SELECT *
FROM top_rated_films;