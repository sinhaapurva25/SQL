-- Question 2
-- Table: Sessions

-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | session_id          | int     |
-- | duration            | int     |
-- +---------------------+---------+
-- session_id is the primary key for this table.
-- duration is the time in seconds that a user has visited the application.
 

-- You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.

-- Write an SQL query to report the (bin, total) in any order.

-- The query result format is in the following example.

-- Sessions table:
-- +-------------+---------------+
-- | session_id  | duration      |
-- +-------------+---------------+
-- | 1           | 30            |
-- | 2           | 199           |
-- | 3           | 299           |
-- | 4           | 580           |
-- | 5           | 1000          |
-- +-------------+---------------+

-- Result table:
-- +--------------+--------------+
-- | bin          | total        |
-- +--------------+--------------+
-- | [0-5>        | 3            |
-- | [5-10>       | 1            |
-- | [10-15>      | 0            |
-- | 15 or more   | 1            |
-- +--------------+--------------+

-- For session_id 1, 2 and 3 have a duration greater or equal than 0 minutes and less than 5 minutes.
-- For session_id 4 has a duration greater or equal than 5 minutes and less than 10 minutes.
-- There are no session with a duration greater or equial than 10 minutes and less than 15 minutes.
-- For session_id 5 has a duration greater or equal than 15 minutes.

-- Solution
/*
CREATE DATABASE X;
USE X;
CREATE TABLE SESSIONS(
SESSION_ID int,
DURATION int);
INSERT INTO SESSIONS(SESSION_ID,DURATION) VALUES(1,30);
INSERT INTO SESSIONS(SESSION_ID,DURATION) VALUES(2,199);
INSERT INTO SESSIONS(SESSION_ID,DURATION) VALUES(3,299);
INSERT INTO SESSIONS(SESSION_ID,DURATION) VALUES(4,580);
INSERT INTO SESSIONS(SESSION_ID,DURATION) VALUES(5,1000);
*/

CREATE TABLE S3(
ID INT,
BIN VARCHAR(255),
TOTAL int);

INSERT INTO S3(ID,BIN,TOTAL) VALUES(1,'[0-5>',NULL);
INSERT INTO S3(ID,BIN,TOTAL) VALUES(2,'[5-10>',NULL);
INSERT INTO S3(ID,BIN,TOTAL) VALUES(3,'[10-15>',NULL);
INSERT INTO S3(ID,BIN,TOTAL) VALUES(4,'[15 or more',NULL);

SELECT S3.BIN,count(S4.bin) as total
FROM (SELECT S1.SESSION_ID AS SESSION_ID, CASE
											WHEN S1.DURATION/60 < 5 THEN '[0-5>'
											WHEN 5 <= S1.DURATION/60 AND S1.DURATION/60 < 10 THEN '[5-10>'
											WHEN 10 <= S1.DURATION/60 AND S1.DURATION/60 < 15 THEN '[10-15>'
											WHEN S1.DURATION/60 >= 15 THEN '[15 or more'
										  END AS BIN
	  FROM SESSIONS S1) S4
RIGHT JOIN S3 ON S3.BIN = S4.BIN
GROUP BY S3.BIN
ORDER BY S3.ID;