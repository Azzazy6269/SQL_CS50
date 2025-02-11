DROP VIEW IF EXISTS "frequently_reviewed";
CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id" ,
       "property_type" ,
       "host_name" ,
       COUNT("reviews"."comments") AS "reviews"
FROM "listings"
JOIN "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listing_id"
ORDER BY "reviews" DESC;


