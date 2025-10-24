-- Find the username of the most popular user, defined as the user who has had the most messages sent to them.

SELECT users."username"
FROM users
JOIN messages ON users."id" == messages."to_user_id"
GROUP BY messages."to_user_id"
ORDER BY COUNT(messages."to_user_id") DESC
LIMIT 1;

