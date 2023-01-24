DROP TABLE submissions;
DROP TABLE hackers;
CREATE TABLE submissions (submission_date date, submission_id int, hacker_id int, score int);
INSERT INTO submissions VALUES('2016-03-01',8494,20703,0);
INSERT INTO submissions VALUES('2016-03-01',22403,53473,15);
INSERT INTO submissions VALUES('2016-03-01',23965,79722,60);
INSERT INTO submissions VALUES('2016-03-01',30173,36396,70);
INSERT INTO submissions VALUES('2016-03-02',34928,20703,0);
INSERT INTO submissions VALUES('2016-03-02',38740,15758,60);
INSERT INTO submissions VALUES('2016-03-02',42769,79722,60);
INSERT INTO submissions VALUES('2016-03-02',44364,79722,60);
INSERT INTO submissions VALUES('2016-03-03',45440,20703,0);
INSERT INTO submissions VALUES('2016-03-03',49050,36396,70);
INSERT INTO submissions VALUES('2016-03-03',50273,79722,5);
INSERT INTO submissions VALUES('2016-03-04',50344,20703,0);
INSERT INTO submissions VALUES('2016-03-04',51360,44065,90);
INSERT INTO submissions VALUES('2016-03-04',54404,53473,65);
INSERT INTO submissions VALUES('2016-03-04',61533,79722,45);
INSERT INTO submissions VALUES('2016-03-05',72852,20703,0);
INSERT INTO submissions VALUES('2016-03-05',74546,38289,0);
INSERT INTO submissions VALUES('2016-03-05',76487,62529,0);
INSERT INTO submissions VALUES('2016-03-05',82439,36396,10);
INSERT INTO submissions VALUES('2016-03-05',9006,36396,40);
INSERT INTO submissions VALUES('2016-03-06',90404,20703,0);
CREATE TABLE hackers (hacker_id integer, name varchar(255));
INSERT INTO hackers VALUES(15758,'Rose');
INSERT INTO hackers VALUES(20703,'Angela');
INSERT INTO hackers VALUES(36396,'Frank');
INSERT INTO hackers VALUES(38289,'Patrick');
INSERT INTO hackers VALUES(44065,'Lisa');
INSERT INTO hackers VALUES(53473,'Kimberly');
INSERT INTO hackers VALUES(62529,'Bonnie');
INSERT INTO hackers VALUES(79722,'Michael');

SELECT IF(S.score = max(S.score),(S.submission_date,count(distinct s.hacker_id),S.hacker_id,H.NAME),'')
FROM hackers H
JOIN SUBMISSIONS S ON S.hacker_id=H.hacker_id
GROUP BY S.submission_date,S.hacker_id
ORDER BY S.submission_date;