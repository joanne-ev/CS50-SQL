/*
Write SQL query to answer a question of your choice. This query should:
- Make use of AS to rename a column
- Involve at least condition, using WHERE
- Sort by at least one column using ORDER BY
*/

-- List the first and last names of the five players who debuted in May in ascending alphabetical order of their last name

SELECT "first_name" AS "First name", "last_name" AS "Last name", "debut" AS "Debut date"
FROM players
WHERE "debut" LIKE '%-05-%'
ORDER BY "last_name"
LIMIT 5;
