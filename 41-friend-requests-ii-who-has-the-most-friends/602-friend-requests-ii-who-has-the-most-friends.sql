WITH CTE_GROUPED AS
(
    SELECT
        requester_id AS id,
        COUNT(*) AS num
    FROM
        RequestAccepted
    GROUP BY
        requester_id
    UNION ALL
    SELECT
        accepter_id AS id,
        COUNT(*) AS num
    FROM
        RequestAccepted
    GROUP BY
        accepter_id
)

SELECT TOP 1
    id,
    SUM(num) AS num
FROM
    CTE_GROUPED
GROUP BY
    id
ORDER BY
    2 DESC;

-- Runtime
-- 262 ms / Beats 93.30%
