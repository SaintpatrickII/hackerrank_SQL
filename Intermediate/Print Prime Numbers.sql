 SET @N = 0;
WITH numbers AS (
    SELECT @N := @N+1 AS num
    FROM (
        SELECT * FROM INFORMATION_SCHEMA.COLUMNS
        UNION ALL
        SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    ) t
    LIMIT 1000
)
SELECT GROUP_CONCAT(num SEPARATOR '&')
FROM numbers n
WHERE (
    SELECT SUM(MOD(n.num, num) = 0)
    FROM numbers
) = 2;

-- come back to this, i hate this problem 