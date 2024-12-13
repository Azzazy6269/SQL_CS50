
SELECT * FROM "addresses" WHERE "address" LIKE '%Somerville%' ;
SELECT * FROM "packages" WHERE "from_address_id" = 432 ;
SELECT * FROM "scans" WHERE "package_id" = 384 ;
SELECT * FROM "addresses" WHERE "id" = 854 ;
-- *** The Devious Delivery ***
SELECT * FROM "packages" WHERE "from_address_id" IS NULL ;
SELECT * FROM "addresses" WHERE "id" = 50 ;
SELECT * FROM "scans" WHERE "id" = 5089 ;
SELECT * FROM "addresses" WHERE "id" = 5089 ;
SELECT * FROM "addresses" WHERE "id" = 2181 ;
-- *** The Forgotten Gift ***
SELECT * FROM "addresses" WHERE "address" = '109 Tileston Street';
SELECT * FROM "addresses" WHERE "address" = '728 Maple Place';
SELECT * FROM "packages" WHERE "from_address_id" = 9873 ;
SELECT * FROM "scans" WHERE "package_id" = 9523 ;
SELECT * FROM "addresses" WHERE "id" = 7432 ;
SELECT * FROM "drivers" WHERE "id" = 17 ;
