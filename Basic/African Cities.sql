SELECT CI.NAME FROM CITY AS CI
JOIN COUNTRY AS CO ON CI.COUNTRYCODE = CO.CODE
WHERE CONTINENT = 'Africa';

-- Alias city and country as CI, CO for readability