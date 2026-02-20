SELECT
    user_id, 
    LEFT(UPPER([name]),1)+(RIGHT(LOWER([name]), LEN([name])-1)) AS [name]
FROM
    Users
ORDER BY
    user_id;

-- Runtime
-- 871 ms / Beats 66.82%
