WITH CTE_PLAYER AS
(
    SELECT
        player_id,
        MIN(event_date) AS min_event_date
    FROM
        Activity
    GROUP BY
        player_id
)

SELECT 
    ROUND(COUNT(*) * 1.0 / (SELECT COUNT(*) FROM CTE_PLAYER), 2) AS fraction
FROM
    CTE_PLAYER P
    INNER JOIN Activity A ON A.player_id = P.player_id AND DATEADD(DAY, 1, P.min_event_date) = A.event_date;