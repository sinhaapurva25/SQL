-- Question 32
-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Id is the primary key column for this table.
-- For example, after running your query, the above Person table should have the following rows:

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+

-- Solution
/*
CREATE DATABASE X;
USE X;
CREATE TABLE PERSON(
ID int,
Email VARCHAR(255));
INSERT INTO PERSON(ID,Email) VALUES(1,'abc@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(2,'abc@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(3,'xyz@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(4,'xyz@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(5,'pqr@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(6,'pqr@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(7,'lmn@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(8,'lmn@gmail.com');
INSERT INTO PERSON(ID,Email) VALUES(9,'def@gmail.com');
*/
SELECT (ROW_NUMBER() OVER (ORDER BY Email)) as ID, Email
FROM PERSON
GROUP BY EMAIL;