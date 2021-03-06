/* LANGUAGE plpgsql */
SELECT A.a, B.b, C.c
FROM (SELECT DISTINCT CAST(B_VOL AS int) AS a FROM utB) AS A INNER JOIN (SELECT DISTINCT CAST(B_VOL AS int) AS b FROM utB) AS B ON A.a < B.b INNER JOIN (SELECT DISTINCT CAST(B_VOL AS int) AS c FROM utB) AS C ON B.b < C.c
WHERE (A.a + B.b > C.c AND B.b + C.c > A.a AND C.c + A.a > B.b) AND (1 = CASE WHEN A.a < C.c AND B.b < C.c AND A.a*A.a + B.b*B.b >= C.c*C.c THEN 1 WHEN B.b < A.a AND C.c < A.a AND B.b*B.b + C.c*C.c >= A.a*A.a THEN 1 WHEN C.c < B.b AND A.a < B.b AND C.c*C.c + A.a*A.a > B.b*B.b THEN 1 ELSE 0 END)