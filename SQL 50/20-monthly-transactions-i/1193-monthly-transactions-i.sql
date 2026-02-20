WITH CTE_TRANSACTIONS AS
(
    SELECT
        CONVERT(CHAR(7), trans_date, 126) AS month,
        country,
        COUNT(id) OVER(PARTITION BY country, CONVERT(CHAR(7), trans_date, 126)) AS trans_count,
        SUM(CASE
            WHEN state = 'approved' THEN 1
            ELSE 0
            END) AS approved_count,
        SUM(CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
            END) AS approved_total_amount
    FROM
        Transactions
    GROUP BY
        id,
        country,
        state,
        CONVERT(CHAR(7), trans_date, 126)
),
CTE_TOTAL_AMOUNT AS
(
    SELECT
        CONVERT(CHAR(7), trans_date, 126) AS month,
        country,
        SUM(amount) AS total_amount
    FROM
        Transactions
    GROUP BY
        country,
        CONVERT(CHAR(7), trans_date, 126)   
)

SELECT
    T.month,
    T.country,
    T.trans_count,
    SUM(T.approved_count) AS approved_count,
    TA.total_amount AS trans_total_amount,
    SUM(T.approved_total_amount) AS approved_total_amount
FROM
    CTE_TRANSACTIONS T
    LEFT JOIN CTE_TOTAL_AMOUNT TA ON TA.month = T.month AND ISNULL(TA.country,-1) = ISNULL(T.country,-1)
GROUP BY
    T.month,
    T.country,
    T.trans_count,
    TA.total_amount;