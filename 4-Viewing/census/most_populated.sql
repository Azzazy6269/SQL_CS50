-- Excute by_district.sql before this file 
DROP VIEW IF EXISTS "most_populated";
CREATE VIEW "most_populated" AS
SELECT * FROM "by_district"
ORDER BY "total_population" DESC;

/*DROP VIEW IF EXISTS "most_populated";
CREATE VIEW "most_populated" AS
SELECT "district",
       SUM("families") AS "total_families",
       SUM("households") AS "total_households",
       SUM("population") AS "total_population",
       SUM("male") AS "total_male",
       SUM("female") AS "total_female"
FROM "census" GROUP BY "district" ORDER BY "total_population" DESC;
*/
