SELECT
    Department,
    Employee,
    Salary
FROM (
    SELECT
        D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        DENSE_RANK() OVER(PARTITION BY D.name ORDER BY E.salary DESC) AS SalaryRank
    FROM
        Employee E
        INNER JOIN Department D ON D.id = E.departmentId
) TB
WHERE
    TB.SalaryRank <= 3;

-- Runtime
-- 482 ms / Beats 46.74%