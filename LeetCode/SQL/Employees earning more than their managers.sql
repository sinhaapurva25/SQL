-- Question 15
-- The Employee table holds all employees including their managers. 
-- Every employee has an Id, and there is also a column for the manager Id.

-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.

-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+

-- Solution
/*
CREATE DATABASE X;
USE X;
CREATE TABLE EMPLOYEE(
ID int,
NAME VARCHAR(255),
SALARY int,
MANAGERID int);

INSERT INTO EMPLOYEE(ID,NAME,SALARY,MANAGERID) VALUES(1,'JOE',70000,3);
INSERT INTO EMPLOYEE(ID,NAME,SALARY,MANAGERID) VALUES(2,'HENRY',80000,4);
INSERT INTO EMPLOYEE(ID,NAME,SALARY,MANAGERID) VALUES(3,'SAM',60000,NULL);
INSERT INTO EMPLOYEE(ID,NAME,SALARY,MANAGERID) VALUES(2,'MAX',90000,NULL);
*/
SELECT E.NAME AS EMPLOYEE
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE E2
ON E.MANAGERID = E2.ID
WHERE E.SALARY > E2.SALARY;

/*
-- another sol
SELECT E.NAME AS EMPLOYEE
FROM EMPLOYEE E, EMPLOYEE E2
WHERE E.SALARY > E2.SALARY AND E.MANAGERID = E2.ID;
*/