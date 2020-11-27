--======================
-- PostgreSQL CROSS JOIN
--======================
-- A CROSS JOIN clause allows you to produce a Cartesian Product of rows in two or more tables.
-- Different from other join clauses such as LEFT JOIN  or INNER JOIN, the CROSS JOIN clause does not have a join
-- predicate.

-- The following illustrates the syntax of the CROSS JOIN syntax:
SELECT select_list
FROM T1
CROSS JOIN T2;

-- The following statement is equivalent to the above statement:
SELECT select_list
FROM T1, T2;


-- Sample tables:
DROP TABLE IF EXISTS T1;
CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);

DROP TABLE IF EXISTS T2;
CREATE TABLE T2 (score INT PRIMARY KEY);

INSERT INTO T1 (label)
VALUES
	('A'),
	('B');

INSERT INTO T2 (score)
VALUES
	(1),
	(2),
	(3);


-- The following statement uses the CROSS JOIN operator to join the table T1 with the table T2.
SELECT *
FROM T1
CROSS JOIN T2;