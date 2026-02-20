SELECT
    num AS ConsecutiveNums 
FROM (
    SELECT DISTINCT
        num,
        LAG(num, 1) OVER(ORDER BY id) AS lag1,
        LAG(num, 2) OVER(ORDER BY id) AS lag2
    FROM
        Logs
    ) TB
WHERE
    num = lag1
    AND lag1 = lag2;

-- Runtime
-- 526 ms / Beats 65.17%