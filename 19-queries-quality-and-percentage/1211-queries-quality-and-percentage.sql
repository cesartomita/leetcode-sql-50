WITH CTE_QUERY_RANK AS
(
    SELECT
        query_name,
        (rating * 1.0 / position) AS normalized_rating
    FROM
        Queries
),
CTE_QUERY_POOR AS
(
    SELECT
        query_name,
        COUNT(*) AS cnt_query_poor
    FROM
        Queries
    WHERE
        rating < 3
    GROUP BY
        query_name
),
CTE_QUALITY AS
(
    SELECT
        query_name,
        CAST(AVG(normalized_rating) AS DECIMAL(9,2)) AS quality
    FROM
        CTE_QUERY_RANK
    GROUP BY
        query_name
),
CTE_QUERY_POOR_PERCENTAGE AS
(
    SELECT DISTINCT
        QP.query_name,
        CAST(((QP.cnt_query_poor * 1.0) / COUNT(Q.query_name) OVER(PARTITION BY Q.query_name)) * 100 AS DECIMAL(9,2)) AS poor_query_percentage
    FROM
        CTE_QUERY_POOR QP
        INNER JOIN Queries Q ON Q.query_name = QP.query_name
)

SELECT
    Q.query_name,
    Q.quality,
    ISNULL(PP.poor_query_percentage, 0) AS poor_query_percentage
FROM
    CTE_QUALITY Q
    LEFT JOIN CTE_QUERY_POOR_PERCENTAGE PP ON PP.query_name = Q.query_name;