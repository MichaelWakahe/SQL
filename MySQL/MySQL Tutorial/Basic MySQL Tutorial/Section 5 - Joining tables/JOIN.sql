-- Section 5. Joining tables
-- MySQL JOIN

CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);


INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');


-- The following shows the basic syntax of the inner join clause that joins two tables table_1 and table_2:
# SELECT column_list
# FROM table_1
# INNER JOIN table_2 ON join_condition;

-- If the join condition uses the equal operator (=) and the column names in both tables used for matching are the same,
-- you can use the USING clause instead:
# SELECT column_list
# FROM table_1
# INNER JOIN table_2 USING (column_name);


-- The following statement finds members who are also the committee members:
SELECT
    m.member_id,
    m.name,
    c.committee_id,
    c.name committee
FROM
    members m
INNER JOIN committees c
	ON c.name = m.name;


-- Because the name columns are the same in both tables, you can use the USING clause as shown in the following query:
SELECT
    m.member_id,
    m.name member,
    c.committee_id,
    c.name committee
FROM
    members m
INNER JOIN committees c USING(name);


-- Here is the basic syntax of a left join clause that joins two tables:
# SELECT column_list
# FROM table_1
# LEFT JOIN table_2 ON join_condition;

-- The left join also supports the USING clause if the column used for matching in both tables are the same:
# SELECT column_list
# FROM table_1
# LEFT JOIN table_2 USING (column_name);

SELECT
    m.member_id,
    m.name member,
    c.committee_id,
    c.name committee
FROM
    members m
LEFT JOIN committees c USING(name);


-- To find members who are not the committee members, you add a WHERE clause and IS NULL operator as follows:
SELECT
    m.member_id,
    m.name,
    c.committee_id,
    c.name committee
FROM
    members m
LEFT JOIN committees c USING(name)
WHERE c.committee_id IS NULL;


-- The right join clause is similar to the left join clause except that the treatment of tables is reversed. The right
-- join starts selecting data from the right table instead of the left table.

-- Here is the syntax of the right join:
# SELECT column_list
# FROM table_1
# RIGHT JOIN table_2 ON join_condition;

-- Similar to the left join clause, the right clause also supports the USING syntax:
# SELECT column_list
# FROM table_1
# RIGHT JOIN table_2 USING (column_name);

-- To find rows in the right table that does not have corresponding rows in the left table, you also use a WHERE clause
-- with the IS NULL operator:
# SELECT column_list
# FROM table_1
# RIGHT JOIN table_2 USING (column_name)
# WHERE column_table_1 IS NULL;


-- This statement uses the right join to join the members and committees tables:
SELECT
    m.member_id,
    m.name,
    c.committee_id,
    c.name committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;

-- The following statement uses the right join clause with the USING syntax:
SELECT
    m.member_id,
    m.name,
    c.committee_id,
    c.name committee
FROM
    members m
RIGHT JOIN committees c USING(name);

-- To find the committee members who are not in the members table, you use this query:
SELECT
    m.member_id,
    m.name,
    c.committee_id,
    c.name committee
FROM
    members m
RIGHT JOIN committees c USING(name)
WHERE m.member_id IS NULL;


-- The cross join combines each row from the first table with every row from the right table to make the result set.
-- Suppose the first table has n rows and the second table has m rows. The cross join that joins the first with the
-- second table will return nxm rows.

-- The following shows the basic syntax of the cross join clause:
# SELECT select_list
# FROM table_1
# CROSS JOIN table_2;

-- This example uses the cross join clause to join the members with the committees tables:
SELECT
    m.member_id,
    m.name,
    c.committee_id,
    c.name committee
FROM
    members m
CROSS JOIN committees c;