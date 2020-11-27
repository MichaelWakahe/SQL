--==================
-- PostgreSQL Joins
--==================

CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');


-- Inner join
SELECT
    basket_a.a,
    basket_a.fruit_a,
    basket_b.b,
    basket_b.fruit_b
FROM
    basket_a
INNER JOIN basket_b
    ON fruit_a = fruit_b;


-- Left join
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
LEFT JOIN basket_b
   ON fruit_a = fruit_b;


-- Left Outer Join
-- To select rows from the left table that do not have matching rows in the right table, you use the left join with a WHERE clause. For example:
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
LEFT JOIN basket_b
    ON fruit_a = fruit_b
WHERE b IS NULL;


-- Right Join
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
RIGHT JOIN basket_b ON fruit_a = fruit_b;

-- Right Outer Join
-- Similarly, you can get rows from the right table that do not have matching rows from the left table by adding a WHERE
-- clause as follows:
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
RIGHT JOIN basket_b
   ON fruit_a = fruit_b
WHERE a IS NULL;

-- The RIGHT JOIN and RIGHT OUTER JOIN are the same therefore you can use them interchangeably.
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
RIGHT outer JOIN basket_b
   ON fruit_a = fruit_b
WHERE a IS NULL;


-- Full Outer Join
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
FULL OUTER JOIN basket_b
    ON fruit_a = fruit_b;

-- To return rows in a table that do not have matching rows in the other, you use the full join with a WHERE clause like this:
SELECT
    a,
    fruit_a,
    b,
    fruit_b
FROM
    basket_a
FULL JOIN basket_b
   ON fruit_a = fruit_b
WHERE a IS NULL OR b IS NULL;