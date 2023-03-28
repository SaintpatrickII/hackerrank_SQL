SELECT ROUND((LONG_W), 4) 
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
-- change lat_n to be the max result with < clause