--DROP VIEW IF EXISTS "no_descriptions" ;
CREATE VIEW "no_descriptions" AS

(SELECT COUNT("id") FROM "listings")
 AS "property_numbers",

(SELECT COUNT("id") FROM "one_bedrooms")
 AS "num_of_one_bedroom_property",

(SELECT COUNT("id")FROM "one_bedrooms" WHERE "accommodates" >= 4)
 AS "num_of_one_bedroom_property,accommodates >=4",

(SELECT COUNT("listing_id") FROM "available" WHERE "date" = '2023-12-31')
 AS "num_of_available_properties_in2023-12-31",

(SELECT COUNT("listing_id") FROM "available" WHERE "date" = '2023-12-31' AND "property_type" LIKE '%boat%')
 AS "num_of_available_boats_in2023-12-31",

(SELECT MAX("reviews")  FROM "frequently_reviewed")--"host_name"
 AS "most_reviewd",


(SELECT COUNT("listing_id") FROM "june_vacancies")
 AS "num_of_properyies_available_in_june"
 ;

--SELECT "most_reviewd" FROM "no_descriptions";


/* initially,
.read one_bedrooms.sql
.read available.sql
.read frequently_reviewed.sql
.read june_vacancies.sql
.read no_descriptions.sql
*/
-- .read no_descriptions.sql
