-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
DROP TABLE IF EXISTS "listenning_history";
DROP TABLE IF EXISTS "likes";
DROP TABLE IF EXISTS "follow";
DROP TABLE IF EXISTS "playlist";
DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "song";
DROP TABLE IF EXISTS "artists";

DROP INDEX IF EXISTS "song_search_by_name";
DROP INDEX IF EXISTS "artist_search_by_name";

CREATE TABLE "users" (
    "id" INTEGER ,
    "username" TEXT NOT NULL ,
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "artists" (
    "id" INTEGER ,
    "artist_name" TEXT NOT NULL ,
    "nationality" TEXT NOT NULL ,
    PRIMARY KEY ("id")
);

CREATE TABLE "song" (
    "id" INTEGER ,
    "artist_id" INTEGER NOT NULL,
    "song_name" TEXT NOT NULL ,
    "song_url" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("artist_id") REFERENCES "artists"("id")
);

CREATE TABLE "playlist" (
    "id" INTEGER ,
    "user_id" INTEGER NOT NULL ,
    "playlist_name" TEXT NOT NULL ,
    "song_id" INTEGER NOT NULL,
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("song_id") REFERENCES "song"("id") ON DELETE CASCADE
);

CREATE TABLE "follow" (
    "user_id" INTEGER NOT NULL ,
    "artist_id" INTEGER NOT NULL ,
    PRIMARY KEY ("user_id", "artist_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE
);

CREATE TABLE "likes" (
    "user_id" INTEGER NOT NULL ,
    "song_id" INTEGER NOT NULL,
    PRIMARY KEY ("user_id", "song_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("song_id") REFERENCES "song"("id") ON DELETE CASCADE
);

CREATE TABLE "listenning_history"(
    "user_id" INTEGER NOT NULL,
    "song_id" INTEGER NOT NULL,
    "played_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY ("song_id") REFERENCES "song"("id") ON DELETE CASCADE
);

CREATE INDEX "song_search_by_name" ON "song"("song_name");
CREATE INDEX "artist_search_by_name" ON "artists"("artist_name");



