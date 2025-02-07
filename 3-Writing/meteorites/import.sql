--reset
DROP TABLE IF EXISTS "meteorites_temp";
DROP TABLE IF EXISTS "meteorites";
--CREATing tables
CREATE TABLE "meteorites_temp"(
    "name" TEXT UNIQUE NOT NULL ,
    "id" INTEGER PRIMARY KEY,
    "nametype" TEXT NOT NULL ,
    "class" TEXT ,
    "mass" TEXT  , --using TEXT to handle empty data before converting
    "discovery" TEXT ,
    "year" TEXT ,
    "lat" TEXT  ,
    "long" TEXT
);
CREATE TABLE "meteorites"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT UNIQUE ,
    "class" TEXT ,
    "mass" REAL ,
    "discovery" TEXT ,
    "year" REAL,
    "lat" REAL ,
    "long" REAL
);
/*After creating the tables write one of the two next comments in the terminal 
1)cat import.sql | sqlite3 metertites.db
2).import --csv --skip 1 meteorites.csv "meteorites_temp"
*/
-- you can also use ATTACH
/*
-- Attach the external SQLite database where the CSV was imported
ATTACH DATABASE 'csv_import.db' AS csv_db;

-- Copy data from the external database into the main database
INSERT INTO meteorites_temp
SELECT *
FROM csv_db.meteorites;

-- Detach the external database after copying data
DETACH DATABASE csv_db;
*/
--SETting empty to NULL
UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE TRIM("mass") = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE TRIM("year") = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE TRIM("lat") = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE TRIM("long") = '';

--ROUNDing to the nearest hundredths
UPDATE "meteorites_temp" SET "mass" = ROUND("mass",2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat",2);
UPDATE "meteorites_temp" SET "long" = ROUND("long",2);

--DELETE the data with nameType "Relict"
DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

--ORDER row by year ASC then by name alphabetically and rewriting id column

INSERT INTO "meteorites"("id","name","class","mass","discovery","year","lat","long")
SELECT
       ROW_NUMBER() OVER (ORDER BY CAST("year" AS INTEGER) ASC , "name" ASC) AS "id",
       "name",
       "class",
       "mass",
       "discovery",
       "year",
       "lat",
       "long"
FROM "meteorites_temp";

-- DROP the temporary table
DROP TABLE "meteorites_temp";


