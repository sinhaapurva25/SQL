SELECT distinct city FROM station
where
substr(city,length(city),1)='A'
or substr(city,length(city),1)='E'
or substr(city,length(city),1)='I'
or substr(city,length(city),1)='O'
or substr(city,length(city),1)='U'
;