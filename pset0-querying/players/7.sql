-- Write a SQL query to count the number of players who bat (or batted) right-handed and throw (or threw) left-handed, or vice versa

SELECT COUNT("id")
FROM players
WHERE ("bat" = 'R' OR "throws" = 'L') OR ("bat" = 'L' OR "throws" = 'R');
