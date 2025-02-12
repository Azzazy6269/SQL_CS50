CREATE TABLE IF NOT EXISTS "Passengers" (
    "id" INTEGER,
    "first name" TEXT,
    "last name" TEXT,
    "age" INTEGER ,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "Check-Ins" (
    "id_passenger" INTEGER,
    "date" TEXT,
    "time" TEXT,
    FOREIGN KEY ("id_passenger") REFERENCES "Passengers"("id")
);

CREATE TABLE IF NOT EXISTS "Airlines" (
    "name" TEXT,
    "concourse" TEXT
);

CREATE TABLE IF NOT EXISTS "Flights" (
    "flight number" INTEGER,
    "airline" TEXT,
    "departing from" TEXT,
    "heading to" TEXT,
    "departure date and time" TEXT,
    "arrival date and time" TEXT
);

INSERT INTO "Passengers" ( id , "first name" , "last name" , age )
     VALUES (1,'Amelia','Earhart',39);
INSERT INTO "Airlines" ( name , concourse )
     VALUES ('Delta','E and F');
INSERT INTO "Flights" ("flight number" , airline , "departing from" , "heading to" , "departure date and time" , "arrival date and time" )
     VALUES (300,'Delta','ATL','BOS','August 3rd 2023 at 6:46 PM','August 3rd 2023 at 9:09 PM');
INSERT INTO "Check-Ins" (id_passenger,date,time)
     VALUES (1,'August 3rd 2023' , '3:03 PM');
