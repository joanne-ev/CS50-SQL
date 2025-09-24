-- Write a SQL query to explore a question of your choice. This query should involve at least one condition, using WHERE with AND or OR

SELECT COUNT("episodes") FROM episodes
WHERE "air_date" > '2015%' AND "season" > 6;
