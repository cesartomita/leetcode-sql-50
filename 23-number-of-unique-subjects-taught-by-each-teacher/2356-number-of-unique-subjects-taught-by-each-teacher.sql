SELECT
    teacher_id,
    SUM(cnt_subject) AS cnt 
FROM (
    SELECT
        teacher_id,
        subject_id,
        COUNT(*) OVER(PARTITION BY teacher_id, subject_id) AS cnt_subject
    FROM
        Teacher
    GROUP BY
        teacher_id,
        subject_id
    ) TB
GROUP BY
    teacher_id;