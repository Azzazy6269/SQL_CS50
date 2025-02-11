--DROP VIEW IF EXISTS "june_vacancies" ;
CREATE VIEW "june_vacancies" AS
SELECT "listings"."id" , "property_type" , "host_name" , COUNT("availabilities"."id") AS "days_vacant"
FROM "listings"
JOIN "availabilities" ON "listings"."id" = "availabilities"."listing_id"
WHERE  "date" < '2023-07-01'
   AND "date" > '2023-05-31'
   AND "available" = 'TRUE'
GROUP BY "listing_id";

--  .read june_vacancies.sql
--  SELECT * FROM "june_vacancies" LIMIT 10 ;
