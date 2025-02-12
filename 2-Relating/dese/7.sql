SELECT schools.name FROM "schools" INNER JOIN "districts" ON schools.district_id = districts.id WHERE districts.name = 'Cambridge' ;
