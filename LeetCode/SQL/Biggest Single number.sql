-- Question 24
-- Table my_numbers contains many numbers in column num including duplicated ones.
-- Can you write a SQL query to find the biggest number, which only appears once.

-- +---+
-- |num|
-- +---+
-- | 8 |
-- | 8 |
-- | 3 |
-- | 3 |
-- | 1 |
-- | 4 |
-- | 5 |
-- | 6 | 
-- For the sample data above, your query should return the following result:
-- +---+
-- |num|
-- +---+
-- | 6 |
-- Note:
-- If there is no such number, just output null.

-- Solution
/*
CREATE DATABASE X;
USE X;
CREATE TABLE MY_NUMBERS(
NUM int);
INSERT INTO MY_NUMBERS(NUM) VALUES(1);
INSERT INTO MY_NUMBERS(NUM) VALUES(2);
INSERT INTO MY_NUMBERS(NUM) VALUES(3);
INSERT INTO MY_NUMBERS(NUM) VALUES(1);
INSERT INTO MY_NUMBERS(NUM) VALUES(2);
INSERT INTO MY_NUMBERS(NUM) VALUES(3);
INSERT INTO MY_NUMBERS(NUM) VALUES(1);
INSERT INTO MY_NUMBERS(NUM) VALUES(2);
INSERT INTO MY_NUMBERS(NUM) VALUES(3);
INSERT INTO MY_NUMBERS(NUM) VALUES(4);
INSERT INTO MY_NUMBERS(NUM) VALUES(6);
INSERT INTO MY_NUMBERS(NUM) VALUES(6);
INSERT INTO MY_NUMBERS(NUM) VALUES(8);
*/
SELECT NUM
FROM MY_NUMBERS
GROUP BY NUM
HAVING COUNT(*)=1
ORDER BY NUM DESC
LIMIT 1;