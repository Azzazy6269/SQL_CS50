
SELECT "city" , "public_for_each_city" FROM (SELECT "city" , COUNT(*) AS "public_for_each_city" FROM "schools" WHERE "type" = 'Public School' GROUP BY "city") ORDER BY "public_for_each_city" DESC LIMIT 10 ;
