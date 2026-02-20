SELECT
    E.employee_id
FROM
    Employees E
    LEFT JOIN Employees M ON M.employee_id = E.manager_id
WHERE
    M.employee_id IS NULL
    AND E.manager_id IS NOT NULL
    AND E.salary < 30000
ORDER BY
    E.employee_id ASC;

-- Runtime
-- 371 ms / Beats 70.91%
