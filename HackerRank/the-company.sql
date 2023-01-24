/*
drop database trial;
create database trial;
use trial;
create table company(
	company_code int,
	founder varchar(17),
    primary key(company_code));
create table lead_manager(
	lead_manager_code int,
	company_code int,
    primary key(lead_manager_code));
create table senior_manager(
	senior_manager_code int,
	lead_manager_code int,
	company_code int,
    primary key(senior_manager_code));
create table manager(
	manager_code int,
	senior_manager_code int,
	lead_manager_code int,
	company_code int,
    primary key(manager_code));
create table employee(
	employee_code int,
	manager_code int,
	senior_manager_code int,
	lead_manager_code int,
	company_code int,
    primary key(employee_code));
*/
select c.company_code,
    c.founder,
    count(distinct e.lead_manager_code),
    count(distinct e.senior_manager_code),
    count(distinct e.manager_code),
    count(distinct e.employee_code)
from company c
    inner join employee e on e.company_code = c.company_code
group by c.company_code,c.founder
order by c.company_code;