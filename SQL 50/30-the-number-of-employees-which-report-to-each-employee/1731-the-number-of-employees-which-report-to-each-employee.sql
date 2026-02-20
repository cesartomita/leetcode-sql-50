SELECT
    E.employee_id,
    E.name,
    COUNT(R.employee_id) AS reports_count,
    ROUND((SUM(R.age) * 1.0) / COUNT(R.employee_id), 0) AS average_age
FROM
    Employees E
    INNER JOIN Employees R ON R.reports_to = E.employee_id
GROUP BY
    E.employee_id,
    E.name
ORDER BY
    E.employee_id;