-- Question 29
-- Table: Sales

-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- sale_id is the primary key of this table.
-- product_id is a foreign key to Product table.
-- Note that the price is per unit.
-- Table: Product

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id is the primary key of this table.
 

-- Write an SQL query that reports the total quantity sold for every product id.

-- The query result format is in the following example:

-- Sales table:
-- +---------+------------+------+----------+-------+
-- | sale_id | product_id | year | quantity | price |
-- +---------+------------+------+----------+-------+ 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |
-- +---------+------------+------+----------+-------+

-- Product table:
-- +------------+--------------+
-- | product_id | product_name |
-- +------------+--------------+
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |
-- +------------+--------------+

-- Result table:
-- +--------------+----------------+
-- | product_id   | total_quantity |
-- +--------------+----------------+
-- | 100          | 22             |
-- | 200          | 15             |
-- +--------------+----------------+

-- Solution
/*
CREATE DATABASE X;
USE X;
CREATE TABLE Sales(sale_id INT,product_id INT,year INT,quantity INT, price INT);
INSERT INTO Sales(sale_id,product_id,year,quantity,price) VALUES (1,100,2008,10,5000);
INSERT INTO Sales(sale_id,product_id,year,quantity,price) VALUES (2,100,2009,12,5000);
INSERT INTO Sales(sale_id,product_id,year,quantity,price) VALUES (7,200,2011,15,9000);

CREATE TABLE PRODUCT(product_id INT,product_NAME VARCHAR(255));
INSERT INTO PRODUCT(product_id,product_NAME) VALUES (100,'Nokia');
INSERT INTO PRODUCT(product_id,product_NAME) VALUES (200,'Apple');
INSERT INTO PRODUCT(product_id,product_NAME) VALUES (300,'Samsung');
*/

SELECT P.product_id,SUM(S.QUANTITY) as total_quantity
FROM Product P
JOIN SALES S
ON P.product_id = S.product_id
GROUP BY P.product_id;