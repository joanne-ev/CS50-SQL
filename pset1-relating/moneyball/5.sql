/*

Write a SQL query to find all teams that Satchel Paige played for.

- Your query should return a table with a single column, one for the name of the teams

*/

SELECT DISTINCT teams."name"
FROM teams
JOIN performances on teams."id" = performances."team_id"
JOIN players on players."id" = performances."player_id"
WHERE players."first_name" = 'Satchel' AND players."last_name" = 'Paige';
