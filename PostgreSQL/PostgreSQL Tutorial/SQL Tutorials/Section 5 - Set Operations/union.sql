--======================
-- PostgreSQL UNION
--======================

-- The UNION operator combines result sets of two or more SELECT statements into a single result set.
-- The following illustrates the syntax of the UNION operator that combines result sets from two queries:
--
-- SELECT select_list_1
-- FROM table_expresssion_1
-- UNION
-- SELECT select_list_2
-- FROM table_expression_2

-- To combine the result sets of two queries using the UNION operator, the queries must conform to the following rules:
--      * The number and the order of the columns in the select list of both queries must be the same.
--      * The data types must be compatible.

-- The UNION operator removes all duplicate rows from the combined data set. To retain the duplicate rows, you use the
-- the UNION ALL instead.


-- The UNION operator may place the rows from the result set of the first query before, after, or between the rows from
-- the result set of the second query. To sort rows in the final result set, you use the ORDER BY clause in the second
-- query.

DROP TABLE IF EXISTS top_rated_films;
CREATE TABLE top_rated_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

DROP TABLE IF EXISTS most_popular_films;
CREATE TABLE most_popular_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

INSERT INTO
   top_rated_films(title,release_year)
VALUES
   ('The Shawshank Redemption',1994),
   ('The Godfather',1972),
   ('12 Angry Men',1957);

INSERT INTO
   most_popular_films(title,release_year)
VALUES
   ('An American Pickle',2020),
   ('The Godfather',1972),
   ('Greyhound',2020);


SELECT * FROM top_rated_films
UNION
SELECT * FROM most_popular_films;

-- The following statement uses the UNION ALL operator to combine result sets from the top_rated_films and most_popular_films tables:
SELECT * FROM top_rated_films
UNION ALL
SELECT * FROM most_popular_films;


-- To sort the result returned by the UNION operator, you place the ORDER BY clause end of the last query like this:
SELECT * FROM top_rated_films
UNION ALL
SELECT * FROM most_popular_films
ORDER BY title;