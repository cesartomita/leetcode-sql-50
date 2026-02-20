WITH CTE_ORDER AS
(
    SELECT
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date,
        IIF(order_date = customer_pref_delivery_date, 'immediate', 'scheduled') AS type_order,
        RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS rank_order_date
    FROM
        Delivery
)

SELECT
    ROUND((SUM(IIF(type_order = 'immediate', 1.0, 0)) * 100) / COUNT(*), 2) AS immediate_percentage 
FROM
    CTE_ORDER
WHERE
    rank_order_date = 1;