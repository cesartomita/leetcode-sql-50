WITH CTE_STUDENT_SUBJECT AS
(
    SELECT DISTINCT
        ST.student_id,
        ST.student_name,
        SU.subject_name
    FROM
        Students ST
        CROSS JOIN Subjects SU
)

SELECT DISTINCT
    ST.student_id,
    ST.student_name,
    ISNULL(EX.subject_name, ST.subject_name) AS subject_name,
    COUNT(EX.subject_name) OVER(PARTITION BY ST.student_id, EX.subject_name) AS attended_exams
FROM
    CTE_STUDENT_SUBJECT ST
    LEFT JOIN Examinations EX ON EX.student_id = ST.student_id AND EX.subject_name = ST.subject_name;
