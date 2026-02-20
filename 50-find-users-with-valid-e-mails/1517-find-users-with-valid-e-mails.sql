SELECT
   user_id,
   [name],
   mail
FROM
    Users
WHERE
    mail COLLATE SQL_Latin1_General_CP1_CS_AS LIKE '%@leetcode.com'
    AND PATINDEX('%[^a-zA-Z0-9@._-]%', mail) = 0
    AND PATINDEX('%[^a-zA-Z]%', LEFT(mail,1)) = 0
    AND LEN(mail) = LEN(REPLACE(mail, '@', '')) + 1;

-- Runtime
-- 777 ms / Beats 90.89%
