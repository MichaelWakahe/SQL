--==========================
-- PostgreSQL GROUPING SETS
--==========================
-- A grouping set is a set of columns by which you group by using the GROUP BY clause.
--
-- A grouping set is denoted by a comma-separated list of columns placed inside parentheses:
-- (column1, column2, ...)

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment;


SELECT
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand;

SELECT
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment;


-- The following query finds the number of products sold for all brands and segments. It defines an empty grouping set
-- which is denoted by ().
SELECT SUM (quantity) FROM sales;


-- Suppose that you want to all the grouping sets by using a single query. To achieve this, you may use the UNION ALL to
-- combine all the queries above.
-- Because UNION ALL requires all result sets to have the same number of columns with compatible data types, you need to
-- adjust the queries by adding NULL to the selection list of each as shown below:

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment

UNION ALL

SELECT
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand

UNION ALL

SELECT
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment

UNION ALL

SELECT
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;


-- The GROUPING SETS allows you to define multiple grouping sets in the same query.
-- The general syntax of the GROUPING SETS is as follows:

SELECT
    c1,
    c2,
    aggregate_function(c3)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (c1, c2),
        (c1),
        (c2),
        ()
);


-- To apply this syntax to the above example, you can use GROUPING SETS clause instead of the UNION ALL clause like this:

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    GROUPING SETS (
        (brand, segment),
        (brand),
        (segment),
        ()
    );