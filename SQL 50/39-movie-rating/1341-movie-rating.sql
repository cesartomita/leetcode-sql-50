WITH CTE_MOVIE AS
(
    SELECT
        U.name,
        M.title,
        CAST(MR.rating AS DECIMAL(9,2)) AS rating,
        COUNT(*) OVER(PARTITION BY MR.user_id) AS cnt_rated_movies,
        created_at
    FROM
        MovieRating MR
        INNER JOIN Users U ON U.user_id = MR.user_id
        INNER JOIN Movies M ON M.movie_id = MR.movie_id
),
CTE_USER_DISTINCT AS
(
    SELECT DISTINCT
        [name]
    FROM
        CTE_MOVIE
    WHERE
        cnt_rated_movies = (SELECT MAX(cnt_rated_movies) FROM CTE_MOVIE)
),
CTE_USER AS
(
    SELECT
        [name],
        ROW_NUMBER() OVER(ORDER BY [name]) AS rn
    FROM
        CTE_USER_DISTINCT
),
CTE_MOVIE_CALC AS
(
    SELECT DISTINCT
        title,
        SUM(rating) OVER(PARTITION BY title) AS sum_rating,
        COUNT([name]) OVER(PARTITION BY title) AS cnt_rating
    FROM
        CTE_MOVIE
    WHERE
        CONVERT(VARCHAR(7), created_at, 126) = '2020-02'
),
CTE_MOVIE_RN AS
(
    SELECT
        title,
        (sum_rating / cnt_rating) AS avg_rating,
        ROW_NUMBER() OVER(ORDER BY (sum_rating / cnt_rating) DESC, title) AS rn
    FROM
        CTE_MOVIE_CALC
)

SELECT
    [name] AS results
FROM
    CTE_USER
WHERE
    rn = 1
UNION ALL
SELECT
    title AS results
FROM
    CTE_MOVIE_RN
WHERE
    rn = 1;

-- Runtime
-- 468 ms / Beats 52.50%