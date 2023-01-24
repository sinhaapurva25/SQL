select Doctor,Professor,Singer,Actor FROM
(select name,occupation from occupations) as tab1
PIVOT
(Name FOR occupation IN (Doctor,Professor,Singer,Actor)) as tab2
<ORDER BY tab2.count(Name)>;