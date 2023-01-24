drop database x;
create database x;
use x;
create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));
insert into entries
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR'),
('C','Bangalore','C@gmail.com',1,'MONITOR'),
('C','Bangalore','C@gmail.com',2,'MONITOR'),
('C','Bangalore','C@gmail.com',2,'MONITOR'),
('C','Bangalore','C@gmail.com',3,'MONITOR'),
('C','Bangalore','C@gmail.com',3,'MONITOR'),
('C','Bangalore','C@gmail.com',3,'MONITOR');

select * from entries;

select name,
       floor as visited_floor,
       count(floor) as number_of_times
from entries
group by name,floor
;

select name, max(S.number_of_times)
from (select name,
             floor as visited_floor,
             count(floor) as number_of_times
	  from entries
      group by name,floor) S
group by S.name
;

select name,
count(*) as total_visits,
group_concat(distinct resources) as resources_used
from entries
group by name;

select Y.name,
	   Y.total_visits,
       X.most_visited_floor,
       Y.resources_used

from (select S1.name,
             S1.visited_floor as most_visited_floor
	 from (select name,
		          floor as visited_floor,
				  count(floor) as number_of_times
	       from entries
		   group by name,floor) S1
	 join (select name,
                  max(S.number_of_times) as number_of_times
	       from (select name,
				        floor as visited_floor,
						count(floor) as number_of_times
		         from entries
		         group by name,floor) S
	       group by S.name) S2
	 on S1.number_of_times = S2.number_of_times
	 where S1.name = S2.name) X

join (select name,
count(*) as total_visits,
group_concat(distinct resources) as resources_used
from entries
group by name) Y

on X.name = Y.name;