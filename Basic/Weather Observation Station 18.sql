SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4) 
FROM STATION;
-- ABS gives result as positive number, here we are taking the difference between both
-- LAT_N and LONG_W, then round to 4sf