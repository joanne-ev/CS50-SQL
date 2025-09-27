/*

Write a SQL query to answer a question you have about the data! The query should:

- Involve at least one JOIN or subquery

*/

-- Find the top ten districts with the greatest dropout percentage

SELECT districts."name", graduation_rates."dropped"
FROM districts
JOIN schools ON schools."district_id" = districts."id"
JOIN graduation_rates ON graduation_rates."school_id" = schools."id"
ORDER BY graduation_rates."dropped" DESC
LIMIT 10;
