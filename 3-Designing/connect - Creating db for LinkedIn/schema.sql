CREATE TABLE "Users" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name"  TEXT NOT NULL,
    "username"   TEXT NOT NULL UNIQUE,
    "password"   TEXT NOT NULL
);

CREATE TABLE "Schools_and_Universities" (
    "id" INTEGER PRIMARY KEY,
    "school_name" TEXT NOT NULL,
    "school_type" TEXT NOT NULL,
    "school_location" TEXT NOT NULL,
    "year_of_founding" INTEGER NOT NULL
);

CREATE TABLE "Companies" (
    "id" INTEGER PRIMARY KEY,
    "company_name" TEXT NOT NULL,
    "company_industry" TEXT NOT NULL,
    "company_location" TEXT NOT NULL
);

CREATE TABLE "Connection_Users" (
    "user1_id" INTEGER NOT NULL,
    "user2_id" INTEGER NOT NULL,
    PRIMARY KEY ("user1_id","user2_id"),
    FOREIGN KEY ("user1_id") REFERENCES "Users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("user2_id") REFERENCES "Users"("id") ON DELETE CASCADE
);

CREATE TABLE "Connection_School" (
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT,
    "degree" TEXT NOT NULL,
    PRIMARY KEY ("user_id","school_id"),
    FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("school_id") REFERENCES "Schools_and_Universities"("id") ON DELETE CASCADE
);

CREATE TABLE "connection_company"(
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT,
    "title" TEXT NOT NULL,
    PRIMARY KEY ("user_id","company_id"),
    FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("company_id") REFERENCES "Companies"("id") ON DELETE CASCADE
);

INSERT INTO "Users" ("id","first_name","last_name","username","password")
     VALUES(1,'Alan','Garber','alan','password');
INSERT INTO "Users" ("id","first_name","last_name","username","password")
     VALUES(2,'Reid','Hoffman','reid','password');
INSERT INTO "Schools_and_Universities" ("id","school_name","school_type","school_location","year_of_founding")
     VALUES(1,'Harvard','University','Cambridge,Massachusetts',1636);
INSERT INTO "Companies"("id","company_name","company_industry","company_location")
     VALUES(1,'LinkedIn','technology','Sunnyvale, California');
INSERT INTO "Connection_School"("user_id","school_id","start_date","end_date","degree")
     VALUES(1,1,'September 1st, 1973',' June 1st, 1976','BA');
INSERT INTO "connection_company"("user_id","company_id","start_date","end_date","title")
     VALUES(1,1,'January 1st, 2003','February 1st, 2007','CEO and Chairman');
