--======================
-- PostgreSQL LEFT JOIN
--======================
-- The following statement illustrates the LEFT JOIN syntax that joins the table A with the table B :
-- SELECT
-- 	pka,
-- 	c1,
-- 	pkb,
-- 	c2
-- FROM
-- 	A
-- LEFT JOIN B ON pka = fka;

SELECT
	film.film_id,
	title,
	inventory_id
FROM
	myschema.film
LEFT JOIN myschema.inventory
    ON inventory.film_id = film.film_id
ORDER BY title;


-- The following statement adds a WHERE clause to find the films that are not in the inventory:
SELECT
	film.film_id,
	film.title,
	inventory_id
FROM
	film
LEFT JOIN inventory
   ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL
ORDER BY title;

-- The following statement returns the same result. The difference is that it uses the table aliases to make the query
-- more concise:
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film f
LEFT JOIN inventory i
   ON i.film_id = f.film_id
WHERE i.film_id IS NULL
ORDER BY title;


-- If both tables have the same column name used in the ON clause, you can use the USING syntax like this:
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film f
LEFT JOIN inventory i USING (film_id)
WHERE i.film_id IS NULL
ORDER BY title;

