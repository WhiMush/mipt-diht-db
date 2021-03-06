/* LANGUAGE plpgsql */
WITH Temp AS (SELECT B_DATETIME, B_Q_ID, B_V_ID, B_VOL, ROW_NUMBER() OVER(ORDER BY B_DATETIME, B_Q_ID, B_V_ID) AS N
FROM utB)

SELECT B_DATETIME, B_Q_ID, B_V_ID, B_VOL, 

CAST(
(SELECT
EXP(SUM(CASE WHEN N % 2 <> 0 THEN LOG(CAST(B_VOL AS FLOAT)) ELSE 0 END))
/
EXP(SUM(CASE WHEN N% 2 = 0 THEN LOG(CAST(B_VOL AS FLOAT)) ELSE 0 END))

FROM Temp
WHERE N <= T.N) AS NUMERIC(12, 8)) AS sv

FROM Temp AS T
