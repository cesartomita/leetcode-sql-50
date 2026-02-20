WITH CTE_QUEUE AS
(
    SELECT
        person_id,
        person_name,
        [weight],
        turn,
        SUM([weight]) OVER(ORDER BY turn) AS sum_turn_weight
    FROM
        [Queue]
)

SELECT TOP 1
    person_name 
FROM
    CTE_QUEUE
WHERE
    sum_turn_weight <= 1000
ORDER BY
    turn DESC;

-- Runtime
-- 1282 ms / Beats 33.70%