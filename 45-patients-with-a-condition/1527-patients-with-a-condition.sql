SELECT
    patient_id,
    patient_name,
    conditions
FROM
    Patients
WHERE
    ' '+conditions LIKE '%[ ]DIAB1%';

-- Runtime
-- 286 ms / Beats 90.89%
