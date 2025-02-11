--DROP VIEW IF EXISTS "available" ;
CREATE VIEW "available" AS
SELECT "listings"."id" , "property_type" , "host_name" , "date"
FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE "availabilities"."available" = 'TRUE';

--SELECT * FROM "available" LIMIT 100;
-- .read available.sql
