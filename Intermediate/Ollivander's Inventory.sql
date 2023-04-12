SELECT w.id, p.age, w.coins_needed, w.power 
FROM Wands w
JOIN Wands_Property p 
on w.code = p.code
WHERE is_evil = 0 AND w.coins_needed = (SELECT MIN(coins_needed) 
                                          FROM WANDS AS X
                                          JOIN WANDS_PROPERTY AS Y 
                                          ON (X.CODE = Y.CODE) 
                                          WHERE X.POWER = W.POWER AND Y.AGE = P.AGE) 
order by power desc, age desc;