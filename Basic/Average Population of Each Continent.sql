SELECT DISTINCT CO.CONTINENT, FLOOR(AVG(CI.POPULATION))
FROM CITY AS CI
JOIN COUNTRY AS CO ON CI.COUNTRYCODE = CO.CODE
GROUP BY CO.CONTINENT;

-- AS we are aggregating with avg, need a group by clause
--  floor used to round to nearest int
-- Distinct needed as we want each continent to appear once