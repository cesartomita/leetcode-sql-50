WITH CTE_CUSTOMER_PRODUCT AS
(
    SELECT
        customer_id ,
        STRING_AGG(product_key, ',') WITHIN GROUP (ORDER BY product_key ASC) AS product_key_agg
    FROM
        (SELECT DISTINCT customer_id, product_key FROM Customer) TB
    GROUP BY
        customer_id
),
CTE_ALL_PRODUCTS AS
(
    SELECT
        STRING_AGG(product_key, ',') WITHIN GROUP (ORDER BY product_key ASC) AS product_key_agg
    FROM
        Product
)

SELECT
    CP.customer_id
FROM
    CTE_CUSTOMER_PRODUCT CP
    INNER JOIN CTE_ALL_PRODUCTS AP ON AP.product_key_agg  = CP.product_key_agg;