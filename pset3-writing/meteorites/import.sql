-- Import CSV file into a temp table
.import --csv meteorites.csv meteorites_temp


-- Replace empty values with NULL
UPDATE meteorites_temp
SET "mass" = NULL
WHERE "mass" = '';

UPDATE meteorites_temp
SET "year" = NULL
WHERE "year" = '';

UPDATE meteorites_temp
SET "lat" = NULL
WHERE "lat" = '';

UPDATE meteorites_temp
SET "long" = NULL
WHERE "long" = '';

-- Round decimal values to two decimal points
UPDATE meteorites_temp
SET "mass" = ROUND("mass", 2), "lat" = ROUND("lat", 2), "long" = ROUND("lat", 2);

-- Remove meteorites with nametype 'Relict'
DELETE FROM meteorites_temp
WHERE "nametype" = 'Relict';


-- Create new meteorites table
CREATE TABLE "meteorites" (
    "name" TEXT NOT NULL UNIQUE,
    "id" INTEGER,
    "class" TEXT,
    "mass" REAL DEFAULT NULL,
    "discovery" TEXT,
    "year" INTEGER DEFAULT NULL,
    "lat" REAL DEFAULT NULL,
    "long" REAL DEFAULT NULL,
    PRIMARY KEY("id")
);

-- Import relevant columns from temp table to actual meteorites table
INSERT INTO meteorites ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM meteorites_temp
ORDER BY "year", "name";

-- Delete temp table
DROP TABLE meteorites_temp;
