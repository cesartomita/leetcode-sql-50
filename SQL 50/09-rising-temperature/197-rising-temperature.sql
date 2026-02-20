SELECT
   W2.id AS Id
FROM
    Weather W1
    INNER JOIN Weather W2 ON DATEDIFF(DAY, W1.recordDate, W2.recordDate) = 1
WHERE
    W2.temperature > W1.temperature;