-- Write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

SELECT schools."name"
FROM graduation_rates
JOIN schools ON schools."id" = graduation_rates."school_id"
WHERE graduation_rates."graduated" = 100;
