use america;
create table students(
id int not null auto_increment,
Name varchar(255),
Marks int,
primary key(id)
);

insert into students(id,Name,Marks) values(1,'Ashley',81);
insert into students(id,Name,Marks) values(2,'Samantha',75);
insert into students(id,Name,Marks) values(3,'Julia',76);
insert into students(id,Name,Marks) values(4,'Belvet',84);

select Name from students
where Marks > 75
order by right(Name,3),id asc;