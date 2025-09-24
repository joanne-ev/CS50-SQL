/*
Write a SQL query to answer a question of your choice about the prints. The query should:
 - Make use of AS to rename a column
- Involve at least one condition, using WHERE
- Sort by at least one column, using ORDER BY
*/

-- List both the Japanese and English titles for five of Hokushi's prints with the greatest contrasts and brightness ordered from lowest to highest.

SELECT "japanese_title" AS "Japanese Print Title","english_title" AS "English Print Title"
FROM views
WHERE "artist" = 'Hiroshige'
ORDER BY "contrast", "brightness"
LIMIT 5;
