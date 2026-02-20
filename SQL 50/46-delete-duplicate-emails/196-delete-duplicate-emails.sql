WITH CTE_DUPLICATE_EMAILS AS
(
    SELECT
        id,
        email,
        COUNT(*) OVER(PARTITION BY email) AS cnt,
        ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rn
    FROM
        Person
)

DELETE
    Person
FROM
    Person P
    INNER JOIN CTE_DUPLICATE_EMAILS TB ON TB.id = P.id AND cnt > 1 AND TB.rn > 1;

-- Runtime
-- 450 ms / Beats 53.59%
