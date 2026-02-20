WITH CTE_CUSTOMER_TOTAL_AMOUNT AS
(
    SELECT
        visited_on,
        SUM(amount) AS total_amount
    FROM
        Customer
    GROUP BY
        visited_on
),
CTE_CUSTOMER_CALC AS
(
    SELECT
        visited_on,
        total_amount,
        SUM(total_amount) OVER(ORDER BY visited_on ROWS BETWEEN  6 PRECEDING AND CURRENT ROW) AS sum_7_days,
        COUNT(*) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS cnt_days
    FROM
        CTE_CUSTOMER_TOTAL_AMOUNT
)

SELECT
    visited_on,
    sum_7_days AS amount,
    ROUND((sum_7_days * 1.0 / cnt_days), 2) AS average_amount 
FROM
    CTE_CUSTOMER_CALC
WHERE
    cnt_days = 7
ORDER BY
    visited_on;

-- Runtime
-- 312 ms / Beats 52.45%
