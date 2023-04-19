SET @i:= 21;
SELECT REPEAT('* ', @i := @i - 1)
FROM INFORMATION_SCHEMA.TABLES
WHERE @i > 0
order by 1 asc limit 1, 20;