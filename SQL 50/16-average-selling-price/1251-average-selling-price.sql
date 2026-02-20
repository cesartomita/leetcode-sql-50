WITH CTE_PRODUCT_SOLD AS
(
    SELECT
        P.product_id,
        P.price,
        US.units,
        CAST((P.price * US.units) AS DECIMAL(10,2)) AS total_price,
        SUM(US.units) OVER(PARTITION BY P.product_id) AS total_units
    FROM
        Prices P
        LEFT JOIN UnitsSold US ON US.product_id = P.product_id AND US.purchase_date BETWEEN P.start_date AND P.end_date
)

SELECT
    product_id,
    ISNULL(CAST(SUM(total_price) / total_units AS DECIMAL(10,2)), 0) AS average_price 
FROM
    CTE_PRODUCT_SOLD
GROUP BY
    product_id,
    total_units;