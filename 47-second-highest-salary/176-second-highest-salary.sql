DECLARE @SecondHighestSalary INT;

SELECT
    @SecondHighestSalary = TB.salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS RN
    FROM
        Employee
) TB
WHERE
    TB.RN = 2;

SELECT @SecondHighestSalary AS SecondHighestSalary;

-- Runtime
-- 372 ms / Beats 54.45%
