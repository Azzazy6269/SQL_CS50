SELECT "city" ,"public_for_each_city" FROM (
  SELECT "city" , COUNT(*) AS "public_for_each_city" FROM "schools"  WHERE "type" = 'Public School' GROUP BY "city")
  WHERE "public_for_each_city" < 4  ORDER BY "public_for_each_city" DESC , "city" ;
