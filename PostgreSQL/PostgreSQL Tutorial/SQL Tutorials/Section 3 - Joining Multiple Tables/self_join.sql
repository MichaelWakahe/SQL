--======================
-- PostgreSQL SELF JOIN
--======================
-- A self-join is a regular join that joins a table to itself. In practice, you typically use a self-join to query
-- hierarchical data or to compare rows within the same table.

-- To form a self-join, you specify the same table twice with different table aliases and provide the join predicate
-- after the ON keyword.

-- The following query uses an INNER JOIN that joins the table to itself:
SELECT select_list
FROM table_name t1
INNER JOIN table_name t2 ON join_predicate;
-- In this syntax, the table_name is joined to itself using the INNER JOIN clause.

-- Also, you can use the LEFT JOIN or RIGHT JOIN clause to join table to itself like this:
SELECT select_list
FROM table_name t1
LEFT JOIN table_name t2 ON join_predicate;


-- sample data
CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	manager_id INT,
	FOREIGN KEY (manager_id)
	REFERENCES employee (employee_id)
	ON DELETE CASCADE
);

INSERT INTO employee (
	employee_id,
	first_name,
	last_name,
	manager_id
)
VALUES
	(1, 'Windy', 'Hays', NULL),
	(2, 'Ava', 'Christensen', 1),
	(3, 'Hassan', 'Conner', 1),
	(4, 'Anna', 'Reeves', 2),
	(5, 'Sau', 'Norman', 2),
	(6, 'Kelsie', 'Hays', 3),
	(7, 'Tory', 'Goff', 3),
	(8, 'Salley', 'Lester', 3);


-- The following query uses the self-join to find who reports to whom:
SELECT
    e.first_name || ' ' || e.last_name employee,
    m .first_name || ' ' || m .last_name manager
FROM
    employee e
INNER JOIN employee m ON m .employee_id = e.manager_id
ORDER BY manager;


-- To include the top manager in the result set, you use the LEFT JOIN instead of INNER JOIN clause as shown in the
-- following query:
SELECT
    e.first_name || ' ' || e.last_name employee,
    m .first_name || ' ' || m .last_name manager
FROM
    employee e
LEFT JOIN employee m ON m .employee_id = e.manager_id
ORDER BY manager;


-- The following query finds all pair of films that have the same length,
SELECT
    f1.title,
    f2.title,
    f1.length
FROM
    myschema.film f1
INNER JOIN myschema.film f2
    ON f1.film_id <> f2.film_id AND
       f1.length = f2.length;