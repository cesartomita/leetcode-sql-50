WITH CTE_SUM AS
(
	SELECT
		machine_id,
		activity_type,
		SUM(timestamp) AS timestamp
	FROM
		Activity
	GROUP BY
		machine_id,
		activity_type
),
CTE_COUNT AS
(
	SELECT DISTINCT
		machine_id,
		COUNT(*) OVER(PARTITION BY machine_id ORDER BY machine_id) / COUNT(*) OVER(PARTITION BY machine_id, process_id ORDER BY machine_id) AS cnt
	FROM
		Activity
),
CTE_CALC AS
(
    SELECT
		S.machine_id,
		SUM(CASE WHEN S.activity_type = 'end' THEN timestamp END) AS [end],
		SUM(CASE WHEN S.activity_type = 'start' THEN timestamp END) AS [start],
		C.cnt
	FROM
		CTE_SUM S
		INNER JOIN CTE_COUNT C ON C.machine_id = S.machine_id
	GROUP BY
		S.machine_id,
		C.CNT
)

SELECT
	machine_id,
	CAST(([end] - [start]) / cnt AS decimal(9,3)) AS processing_time
FROM
    CTE_CALC;