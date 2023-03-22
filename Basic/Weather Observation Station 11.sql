SELECT DISTINCT CITY FROM STATION
WHERE (NOT(
CITY LIKE '%a' OR
CITY LIKE '%e' OR
CITY LIKE '%i' OR
CITY LIKE '%o' OR
CITY LIKE '%u'))
OR (NOT(
CITY LIKE 'a%' OR
CITY LIKE 'e%' OR
CITY LIKE 'i%' OR
CITY LIKE 'o%' OR
CITY LIKE 'u%'));
-- note this is a not start with OR not end with vowel