CREATE VIEW "june_vacancies" AS
SELECT "id", "property_type", "host_name", COUNT("date") AS "days_vacant"
FROM available
WHERE "date" LIKE '2023-06%'
GROUP BY "id";

