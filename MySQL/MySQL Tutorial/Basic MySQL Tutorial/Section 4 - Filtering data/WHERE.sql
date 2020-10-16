-- Section 4. Filtering data
-- MySQL WHERE

-- The WHERE clause allows you to specify a search condition for the rows returned by a query. The following shows the syntax of the WHERE clause:
# SELECT
#     select_list
# FROM
#     table_name
# WHERE
#     search_condition;

SELECT
    lastname,
    firstname,
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';


-- Using MySQL WHERE clause with AND operator
SELECT
    lastname,
    firstname,
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND
    officeCode = 1;


-- Using MySQL WHERE clause with OR operator
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR
    officeCode = 1
ORDER BY
    officeCode ,
    jobTitle;


--  Using MySQL WHERE with BETWEEN operator example
SELECT
    firstName,
    lastName,
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;


-- Using MySQL WHERE with the LIKE operator example
-- The LIKE operator evaluates to TRUE if a value matches a specified pattern. To form a pattern, you use % and
-- _ wildcards. The % wildcard matches any string of zero or more characters while the _ wildcard matches any single
-- character.
SELECT
    firstName,
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;


-- Using MySQL WHERE clause with the IN operator example
SELECT
    firstName,
    lastName,
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY
    officeCode;


-- Using MySQL WHERE  clause with the IS NULL operator
SELECT
    lastName,
    firstName,
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;


# Operator	    Description
# =	            Equal to. You can use it with almost any data types.
# <> or !=	    Not equal to
# <	            Less than. You typically use it with numeric and date/time data types.
# >	            Greater than.
# <=	        Less than or equal to
# >=	        Greater than or equal to
SELECT
    lastname,
    firstname,
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';

SELECT
    lastname,
    firstname,
    officeCode
FROM
    employees
WHERE
    officecode > 5;

SELECT
    lastname,
    firstname,
    officeCode
FROM
    employees
WHERE
    officecode <= 4;