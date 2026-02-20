/* Write your T-SQL query statement below */

WITH CTE_EMPLOYEE AS
(
    SELECT
        employee_id
    FROM
        Employee
    GROUP BY
        employee_id
    HAVING
        COUNT(*) = 1
)

SELECT
    E.employee_id,
    E.department_id
FROM
    CTE_EMPLOYEE TB
    INNER JOIN Employee E ON E.employee_id = TB.employee_id
UNION
SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = 'Y';

-- Runtime
-- 431 ms / Beats 72.38%
