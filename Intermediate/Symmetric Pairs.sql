-- We need to create a table that notes row number as to not compare the same row
-- this is needed as to compare X to Y we are joining the table on itself

with enum as (
SELECT X, Y,
ROW_NUMBER() OVER(ORDER BY X, Y) AS rn
FROM functions f
)
-- now we compare to see if x1 = y2, x2 = y1, distinct as we dont want to repeat pairs
SELECT  DISTINCT e.X, e.Y
FROM enum e
join enum e2
-- comparing
ON e.X = e2.Y
AND e2.X = e.Y
-- make sure row numbers dont match
AND e.rn <> e2.rn
-- one condition is to make sure x<= y
WHERE e.x <= e.y
ORDER BY X, Y;