DECLARE @largest_single_number AS INT;

SELECT TOP 1
    @largest_single_number = num
FROM
    MyNumbers
GROUP BY
    num
HAVING
    COUNT(*) = 1
ORDER BY
    num DESC;

SELECT @largest_single_number AS num;