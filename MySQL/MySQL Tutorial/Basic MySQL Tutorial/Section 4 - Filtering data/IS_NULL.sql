-- Section 4. Filtering data
-- MySQL IS NULL

# value IS NULL
# value IS NOT NULL

SELECT
    customerName,
    country,
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY
    customerName;


SELECT
    customerName,
    country,
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY
   customerName;