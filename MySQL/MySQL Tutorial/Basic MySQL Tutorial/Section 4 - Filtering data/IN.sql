-- Section 4. Filtering data
-- MySQL IN

# SELECT
#     column1,column2,...
# FROM
#     table_name
# WHERE
# 	(expr|column_1) IN ('value1','value2',...);

SELECT
    officeCode,
    city,
    phone,
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');


-- You can achieve the same result with the OR operator as the following query:
SELECT
    officeCode,
    city,
    phone,
    country
FROM
    offices
WHERE
    country = 'USA' OR country = 'France';


SELECT
    officeCode,
    city,
    phone,
    country
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France');


-- Using MySQL IN with a subquery
SELECT
	orderNumber,
	customerNumber,
	status,
	shippedDate
FROM
	orders
WHERE orderNumber IN
(
	 SELECT
		 orderNumber
	 FROM
		 orderdetails
	 GROUP BY
		 orderNumber
	 HAVING SUM(quantityOrdered * priceEach) > 60000
);
