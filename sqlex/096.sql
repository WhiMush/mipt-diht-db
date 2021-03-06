/* LANGUAGE plpgsql */
WITH Red AS (SELECT DISTINCT B_V_ID
FROM (SELECT B_Q_ID
FROM (SELECT *, (SELECT V_COLOR FROM utV WHERE V_ID = B_V_ID) AS C
FROM utB) AS T
GROUP BY B_Q_ID
HAVING SUM(CASE WHEN C = 'B' THEN B_VOL ELSE 0 END) > 0) AS A INNER JOIN (SELECT *, (SELECT V_COLOR FROM utV WHERE V_ID = B_V_ID) AS C
FROM utB) AS R ON A.B_Q_ID = R.B_Q_ID
WHERE R.C = 'R')

SELECT (SELECT V_NAME FROM utV WHERE V_ID = Red.B_V_ID) AS Name
FROM Red INNER JOIN utB ON Red.B_V_ID = utB.B_V_ID
GROUP BY Red.B_V_ID
HAVING COUNT(*) > 1