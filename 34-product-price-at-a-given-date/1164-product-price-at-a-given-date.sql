WITH CTE_PRODUCTS AS
(
    SELECT DISTINCT
        product_id
    FROM
        Products
),
CTE_PRODUCTS_NEW_PRICE AS
(
    SELECT
        product_id,
        new_price AS new_price,
        ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM
        Products P
    WHERE
        change_date <= '2019-08-16'
)

SELECT
    B.product_id,
    ISNULL(A.new_price, 10) AS price
FROM    
    CTE_PRODUCTS_NEW_PRICE A
    RIGHT JOIN CTE_PRODUCTS B ON B.product_id = A.product_id AND A.rn = 1;

-- Runtime
-- 911 ms / Beats 52.98%
