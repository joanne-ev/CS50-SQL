/*

Write a SQL query to find the 10 cities with the most public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.

*/

SELECT "city", COUNT("id") AS "number_of_schools"
FROM schools
WHERE "type" LIKE '%public%'
GROUP BY "city"
ORDER BY "number_of_schools" DESC, "city"
LIMIT 10;
