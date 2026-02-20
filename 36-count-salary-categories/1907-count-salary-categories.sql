WITH CTE_SALARY_CATEGORY AS
(
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
            END AS category
    FROM
        Accounts
),
CTE_SALARY_CATEGORY_ACCOUNTS_COUNT AS
(
    SELECT
        category,
        COUNT(category) AS accounts_count
    FROM
        CTE_SALARY_CATEGORY
    GROUP BY
        category
)

SELECT
    TB.category,
    ISNULL(C.accounts_count, 0) AS accounts_count
FROM
    CTE_SALARY_CATEGORY_ACCOUNTS_COUNT C
    RIGHT JOIN (
            VALUES
                ('Low Salary'),
                ('Average Salary'),
                ('High Salary')
        ) AS TB(category) ON C.category = TB.category;

-- Runtime
-- 10105 ms / Beats 87.33%
