WITH CTE AS
(
    SELECT
        tiv_2016,
        COUNT(*) OVER(PARTITION BY tiv_2015) AS cnt_tiv_2015,
        COUNT(*) OVER(PARTITION BY lat, lon) AS cnt_lat_lon
    FROM
        Insurance
)

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016 
FROM
    CTE
WHERE
    cnt_tiv_2015 > 1
    AND cnt_lat_lon = 1;

-- Runtime
-- 483 ms / Beats 96.39%
