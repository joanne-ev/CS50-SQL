-- Write a SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States. Your query should output a table with a single column for the title of each episode.

SELECT "title" FROM episodes
WHERE "air_date" LIKE "%-12-%";
