-- Find the user IDs of the top 3 users to whom creativewisdom377 sends messages most frequently

SELECT messages."to_user_id"
FROM users
JOIN messages ON users."id" = messages."from_user_id"
WHERE users."username" = 'creativewisdom377'
GROUP BY messages."to_user_id"
ORDER BY COUNT(messages."to_user_id") DESC
LIMIT 3;
