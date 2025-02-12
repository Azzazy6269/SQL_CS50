SELECT ROUND(AVG("height"),2) AS "Average height per each city" FROM "players"
  WHERE "birth_country" = 'USA' 
  GROUP BY "birth_city"
  ORDER BY "Average height per each city" DESC ;
