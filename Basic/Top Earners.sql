SELECT MAX(SALARY * MONTHS), COUNT(SALARY * MONTHS)
FROM EMPLOYEE
GROUP BY SALARY * MONTHS
ORDER BY (SALARY * MONTHS) DESC
LIMIT 1;

-- two columns for the max earning, and the number of people at that earnings
-- grouped by (salary * months) as otherwise the count will just count the number of employees
-- order this by (salary * months) desc so we get top earners first, then limit 1 so we only get top earner as output