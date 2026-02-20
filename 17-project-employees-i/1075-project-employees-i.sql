SELECT DISTINCT
    P.project_id,
    ROUND(
        SUM(E.experience_years) OVER(PARTITION BY P.project_id) * 1.0 / COUNT(P.project_id) OVER(PARTITION BY P.project_id),
        2
    ) AS average_years
FROM
    Project P
    INNER JOIN Employee E ON E.employee_id = P.employee_id;