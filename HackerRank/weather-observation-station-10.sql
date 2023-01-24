select distinct CITY FROM STATION
WHERE RIGHT(CITY,1) NOT IN ('a','e','i','o','u');