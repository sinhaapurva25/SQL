/*
drop table station;
create table station(
	id int not null auto_increment,
	city varchar(255),
	primary key(id)
);

insert into station (id,city) values(1,'kol');
insert into station (id,city) values(2,'bena');
insert into station (id,city) values(3,'bang');
insert into station (id,city) values(4,'assam');
insert into station (id,city) values(5,'essom');
insert into station (id,city) values(6,'indo');

SELECT distinct substr(city,1,1) FROM station
;
*/
SELECT distinct city FROM station
where
substr(city,1,1)='A'
or substr(city,1,1)='E'
or substr(city,1,1)='I'
or substr(city,1,1)='O'
or substr(city,1,1)='U'
;