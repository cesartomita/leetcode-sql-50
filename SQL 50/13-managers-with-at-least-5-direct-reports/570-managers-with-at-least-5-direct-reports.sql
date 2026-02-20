WITH CTE_MANAGER AS
(
    SELECT
        M.id AS ID,
        M.name AS MANAGER,
        COUNT(R.managerId) OVER(PARTITION BY R.managerId) AS CNT
    FROM
        Employee M
        INNER JOIN Employee R ON R.managerId = M.id
),
CTE_MANAGER_REPORT AS
(
    SELECT DISTINCT
        ID,
        MANAGER
    FROM   
        CTE_MANAGER
    WHERE
        CNT >= 5
)

SELECT
    MANAGER AS [name]
FROM
    CTE_MANAGER_REPORT;