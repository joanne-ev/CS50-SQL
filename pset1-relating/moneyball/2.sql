/*

Write a SQL query to find Cal Ripken Jr.’s salary history.

- Sort by year in descending order.
- Your query should return a table with two columns, one for year and one for salary.

*/

SELECT salaries."year", salaries."salary"
FROM salaries
JOIN players ON players."id" = salaries."player_id"
WHERE players."first_name" LIKE '%Cal%' AND players."last_name" LIKE '%Ripken%'
ORDER BY salaries."year" DESC;
