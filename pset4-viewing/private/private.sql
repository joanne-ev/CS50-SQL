/*

+------+----+----+
|   14 | 98 |  4 |
|  114 |  3 |  5 |
|  618 | 72 |  9 |
|  630 |  7 |  3 |
|  932 | 12 |  5 |
| 2230 | 50 |  7 |
| 2346 | 44 | 10 |
| 3041 | 14 |  5 |
+------+----+----+

*/

-- Create new table
CREATE TABLE messages (
    "id" INTEGER,
    "phrase" TEXT,
    PRIMARY KEY("id")
);


-- Message 1:  14 | 98 |  4
INSERT INTO messages ("phrase")
SELECT substr("sentence", 98, 4)
FROM sentences
WHERE "id" = 14;

-- Message 2:  114 |  3 |  5
INSERT INTO messages ("phrase")
SELECT substr("sentence", 3, 5)
FROM sentences
WHERE "id" = 114;

-- Message 3:  618 | 72 |  9
INSERT INTO messages ("phrase")
SELECT substr("sentence", 72, 9)
FROM sentences
WHERE "id" = 618;

-- Message 4:  630 |  7 |  3
INSERT INTO messages ("phrase")
SELECT substr("sentence", 7, 3)
FROM sentences
WHERE "id" = 630;

-- Message 5: 932 | 12 |  5
INSERT INTO messages ("phrase")
SELECT substr("sentence", 12, 5)
FROM sentences
WHERE "id" = 932;

-- Message 6:  2230 | 50 |  7
INSERT INTO messages ("phrase")
SELECT substr("sentence", 50, 7)
FROM sentences
WHERE "id" = 2230;

-- Message 7: 2346 | 44 | 10
INSERT INTO messages ("phrase")
SELECT substr("sentence", 44, 10)
FROM sentences
WHERE "id" = 2346;

-- Message 8:  3041 | 14 |  5
INSERT INTO messages ("phrase")
SELECT substr("sentence", 14, 5)
FROM sentences
WHERE "id" = 3041;

-- Create view
CREATE VIEW "message" AS
SELECT "phrase"
FROM messages;
