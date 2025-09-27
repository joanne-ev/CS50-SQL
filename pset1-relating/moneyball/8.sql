/*

Write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.

- Your query should return a table with one column, the salary of the player.

*/


SELECT salaries."salary"
FROM salaries
JOIN performances on performances."player_id" = salaries."player_id"
WHERE performances."year" = 2001 AND salaries."year" = 2001
ORDER BY performances."HR" DESC
LIMIT 1;
