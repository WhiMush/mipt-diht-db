/* LANGUAGE plpgsql */
SELECT 
    CONVERT(CHAR(4), B_DATETIME, 120) AS year
    , SUM(B_VOL) AS cnt
FROM 
    utB
GROUP BY 
    CONVERT(CHAR(4), B_DATETIME, 120)
HAVING 
    COUNT(DISTINCT B_DATETIME)>10

UNION ALL

SELECT 
    CONVERT(CHAR(7), B_DATETIME, 120) AS year
    , SUM(B_VOL) AS cnt
FROM 
    utB
GROUP BY 
    CONVERT(CHAR(7), B_DATETIME, 120)
HAVING 
    COUNT(DISTINCT B_DATETIME)>10

UNION ALL

SELECT 
    CONVERT(CHAR(10), B_DATETIME, 120) AS year
    , SUM(B_VOL) AS cnt
FROM 
    utB
GROUP BY 
    CONVERT(CHAR(10), B_DATETIME, 120)
HAVING 
    COUNT(DISTINCT B_DATETIME)>10
