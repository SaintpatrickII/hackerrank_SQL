SELECT SUM(CITY.POPULATION) FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT = 'Asia';

-- JOIN CITY AND COUNTRY ON MATCHING COLUMN
-- NEED TO HAVE SUM(CITY.POPULAATION OTHERWISE IS AMBIGUOUS)