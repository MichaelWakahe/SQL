--=========================
-- PostgreSQL NATURAL JOIN
--========================
-- A natural join is a join that creates an implicit join based on the same column names in the joined tables.
-- The following shows the syntax of the PostgreSQL natural join:
SELECT select_list
FROM T1
NATURAL [INNER, LEFT, RIGHT] JOIN T2;

-- A natural join can be an inner join, left join, or right join. If you do not specify a join explicitly e.g.,
-- INNER JOIN, LEFT JOIN, RIGHT JOIN, PostgreSQL will use the INNER JOIN by default.

-- If you use the asterisk (*) in the select list, the result will contain the following columns:
--      * All the common columns, which are the columns from both tables that have the same name.
--      * Every column from both tables, which is not a common column.


-- Sample data:
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	category_id serial PRIMARY KEY,
	category_name VARCHAR (255) NOT NULL
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories (category_id)
);
-- Each category has zero or many products and each product belongs to one and only one category.

INSERT INTO categories (category_name)
VALUES
	('Smart Phone'),
	('Laptop'),
	('Tablet');

INSERT INTO products (product_name, category_id)
VALUES
	('iPhone', 1),
	('Samsung Galaxy', 1),
	('HP Elite', 2),
	('Lenovo Thinkpad', 2),
	('iPad', 3),
	('Kindle Fire', 3);


-- The following statement uses the NATURAL JOIN clause to join the products table with the categories table:
SELECT * FROM products
NATURAL JOIN categories;


-- The above statement is equivalent to the following statement that uses the INNER JOIN clause.
SELECT	* FROM products
INNER JOIN categories USING (category_id);