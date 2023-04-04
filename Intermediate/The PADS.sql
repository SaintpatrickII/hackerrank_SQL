SELECT CONCAT(Name, '(', LEFT(occupation,1), ')') AS a FROM occupations

UNION

SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', lower(occupation),'s.')
FROM occupations
GROUP BY occupation
ORDER BY a;