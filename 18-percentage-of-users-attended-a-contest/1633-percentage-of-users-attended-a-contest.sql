SELECT DISTINCT
    R.contest_id,
    CAST((COUNT(U.user_id) OVER(PARTITION BY R.contest_id) * 1.0 / (SELECT COUNT(*) FROM Users)) * 100 AS DECIMAL(9,2)) AS [percentage]
FROM
    Users U
    INNER JOIN Register R ON R.user_id = U.user_id
ORDER BY
    [percentage] DESC,
    R.contest_id;