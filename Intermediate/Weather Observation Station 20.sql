SELECT ROUND(S.LAT_N, 4) FROM STATION S 
     WHERE 
         (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N > S.LAT_N) 
         = (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N < S.LAT_N);

-- finds spot where no of results above & below median are equal