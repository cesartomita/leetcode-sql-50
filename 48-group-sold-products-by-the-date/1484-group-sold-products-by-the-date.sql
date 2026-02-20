SELECT
    sell_date,
    COUNT(sell_date) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product ASC) AS products
FROM (
    SELECT DISTINCT
        sell_date,
        product
    FROM
        Activities
    ) TB
GROUP BY
    sell_date;

-- Runtime
-- 727 ms / Beats 74.90%
