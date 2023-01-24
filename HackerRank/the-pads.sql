select concat(Name,'(',substring(occupation,1,1),')')
from occupations
Order by Name;

select concat('There are a total of ',count(occupation),' ',lower(occupation),'s.') 
from occupations
group by occupation
order by count(occupation);