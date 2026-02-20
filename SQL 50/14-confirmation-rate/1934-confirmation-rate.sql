WITH CTE_USER AS
(
    SELECT
        S.user_id AS [USER_ID],
        COUNT(C.user_id) AS CNT_USER
    FROM
        Signups S
        LEFT JOIN Confirmations C ON C.user_id = S.user_id
    GROUP BY
        S.user_id
),
CTE_CONFIRMED AS
(
    SELECT
        S.user_id AS [USER_ID],
        C.action AS [ACTION],
        SUM(IIF(C.action = 'confirmed', 1, 0)) AS CNT_CONFIRMED
    FROM
        Signups S
        LEFT JOIN Confirmations C ON C.user_id = S.user_id
    GROUP BY
        S.user_id,
        C.action
),
CTE_CONFIRMATION_RATE AS
(
    SELECT
        U.USER_ID AS [user_id],
        CAST(CAST(C.CNT_CONFIRMED AS DECIMAL(9,2)) / IIF(U.CNT_USER = 0, 1, U.CNT_USER) AS DECIMAL(9,2)) AS confirmation_rate
    FROM
        CTE_CONFIRMED C
        INNER JOIN CTE_USER U ON U.USER_ID = C.USER_ID
)

SELECT
    user_id,
    MAX(confirmation_rate) AS confirmation_rate
FROM
    CTE_CONFIRMATION_RATE
GROUP BY
    user_id;