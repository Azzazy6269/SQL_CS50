SELECT "english_title" , ROUND(AVG(entropy),0) AS "AVG_entropy"
  FROM "views" WHERE "artist" = 'Hiroshige' 
  GROUP BY "artist" ORDER BY "AVG_entropy" ;
