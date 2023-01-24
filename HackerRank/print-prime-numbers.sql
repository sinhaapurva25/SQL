set @number = 0
select repeat(@number, @number := @number+1) from informtaionschema.tables
where mod(@)