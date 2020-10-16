-- Section 4. Filtering data
-- MySQL LIKE

-- Here is the syntax of the LIKE operator:
-- expression LIKE pattern ESCAPE escape_character

-- MySQL provides two wildcard characters for constructing patterns: percentage % and underscore _ .
--      The percentage ( % ) wildcard matches any string of zero or more characters.
--      The underscore ( _ ) wildcard matches any single character.


SELECT
    employeeNumber,
    lastName,
    firstName
FROM
    employees
WHERE
    firstName LIKE 'a%';


SELECT
    employeeNumber,
    lastName,
    firstName
FROM
    employees
WHERE
    lastName LIKE '%on';


-- To find all employees whose last names contain on , you use the following query with the pattern %on%
SELECT
    employeeNumber,
    lastName,
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';


-- To find employees whose first names start with  T , end with m, and contain any single character between e.g., Tom ,
-- Tim, you use the underscore (_) wildcard to construct the pattern as follows:
SELECT
    employeeNumber,
    lastName,
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';


-- Note that the pattern is not case sensitive, therefore, the b% or B% pattern returns the same result.
-- Suppose you want to search for employees whose last names don’t start with the character B:
SELECT
    employeeNumber,
    lastName,
    firstName
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';


-- Sometimes the pattern, which you want to match, contains wildcard character e.g., 10%, _20, etc. In this case, you
-- can use the ESCAPE clause to specify the escape character so that MySQL will interpret the wildcard character as a
-- literal character.
SELECT
    productCode,
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';


-- Or you can specify a different escape character e.g., $ by using the ESCAPE clause:
SELECT
    productCode,
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';