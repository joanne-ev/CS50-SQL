-- Write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).

SELECT districts."name"
FROM districts
JOIN expenditures ON expenditures."district_id" = districts."id"
ORDER BY expenditures."pupils"
LIMIT 1;
