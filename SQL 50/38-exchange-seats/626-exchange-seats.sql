DECLARE @MAX_ID INT = (SELECT MAX(id) FROM Seat);

WITH CTE_STUDENT AS
(
    SELECT
        id,
        student,
        CASE
            WHEN id % 2 = 1 AND id + 1 <= @MAX_ID THEN id + 1
            WHEN id % 2 = 0 THEN id - 1
            ELSE id
            END AS new_id
    FROM
        Seat
)

SELECT
    new_id AS id,
    student 
FROM
    CTE_STUDENT
ORDER BY
    new_id;

-- Runtime
-- 289 ms / Beats 69.05%