WITH CTE_PRODUCT_YEAR AS
(
    SELECT
        sale_id,
        product_id,
        year,
        quantity,
        price,
        RANK() OVER(PARTITION BY product_id ORDER BY year) AS rank_year
    FROM
        Sales
)

SELECT
    product_id,
    year AS first_year,
    quantity,
    price 
FROM
    CTE_PRODUCT_YEAR
WHERE
    rank_year = 1;