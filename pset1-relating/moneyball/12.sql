/*

Write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.

- Your query should return a table with two columns, one for the players’ first names and one of their last names.
- You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
- Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).
- Keep in mind the lessons you’ve learned in 10.sql and 11.sql!

expected: "Hunter, To..."
actual:   "Albert, Pu..."

*/


SELECT players."first_name", players."last_name"
FROM players
WHERE players."id" IN (

    SELECT "id"
    FROM (
        -- 10 least expensive players per hit
        SELECT DISTINCT players."id"
        FROM players
        JOIN performances ON players."id" = performances."player_id"
        JOIN salaries ON players."id" = salaries."player_id"
        WHERE performances."year" == salaries."year"
        AND performances."year" = 2001
        AND performances."H" != 0 AND salaries."salary" != 0
        ORDER BY (salaries."salary" / performances."H"), players."id", players."last_name"
        LIMIT 10
    )

    INTERSECT

    SELECT "id"
    FROM (
        -- 10 least expensive players per hit
        SELECT DISTINCT players."id"
        FROM players
        JOIN performances ON players."id" = performances."player_id"
        JOIN salaries ON players."id" = salaries."player_id"
        WHERE performances."year" == salaries."year"
        AND performances."year" = 2001
        AND performances."RBI" != 0 AND salaries."salary" != 0
        ORDER BY (salaries."salary" / performances."RBI"), players."id", players."last_name"
        LIMIT 10
    )

);
