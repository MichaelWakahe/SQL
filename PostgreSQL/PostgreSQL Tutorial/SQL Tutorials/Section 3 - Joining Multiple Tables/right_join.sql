--======================
-- PostgreSQL RIGHT JOIN
--======================
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS film_reviews;

CREATE TABLE films(
   film_id SERIAL PRIMARY KEY,
   title varchar(255) NOT NULL
);

INSERT INTO films(title)
VALUES('Joker'),
      ('Avengers: Endgame'),
      ('Parasite');

CREATE TABLE film_reviews(
   review_id SERIAL PRIMARY KEY,
   film_id INT,
   review VARCHAR(255) NOT NULL
);

INSERT INTO film_reviews(film_id, review)
VALUES(1, 'Excellent'),
      (1, 'Awesome'),
      (2, 'Cool'),
      (NULL, 'Beautiful');


-- The following statement uses the RIGHT JOIN to select data from the films and film_reviews tables:
-- Note that the RIGHT OUTER JOIN is the same as RIGHT JOIN. The OUTER keyword is optional.
SELECT
   film_reviews.review,
   films.title
FROM
   films
RIGHT JOIN film_reviews
   ON film_reviews.film_id = films.film_id;


-- Because the joined column has the same name (film_id), you can use the USING syntax in the join predicate like this:
SELECT film_reviews.review, films.title
FROM films
RIGHT JOIN film_reviews USING (film_id);


-- To find the rows from the right table that does not have any corresponding rows in the left table, you add a WHERE
-- clause like this:
SELECT film_reviews.review, films.title
FROM films
RIGHT JOIN film_reviews using (film_id)
WHERE title IS NULL;