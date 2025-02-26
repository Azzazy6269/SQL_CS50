-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
DROP VIEW IF EXISTS "Marwan Pablo songs";
DROP VIEW IF EXISTS "Hyssien songs";
DROP VIEW IF EXISTS "The weekend songs";
DROP VIEW IF EXISTS "Drake songs";


INSERT INTO "users" ("id","username","email","password","nationality")
    VALUES(1,'azzazy','azzazy@gmail.com','spotify123456','egyptian'),
          (2,'peter','peter@gmail.com','password123456','canadian');

INSERT INTO "artists" ("id","artist_name","nationality")
    VALUES(1,'Marwan Pablo','egyptian'),
          (2,'Hyssien','egyptian'),
          (3,'The weekend','canadian'),
          (4,'Drake','candian');

INSERT INTO "song"("id","artist_id","song_name","song_url")
    VALUES(1, 1, 'Ghaba', 'https://spotify.com/marwanpablo/ghaba'),
          (2, 1, 'El Gemeza', 'https://spotify.com/marwanpablo/elgemeza'),
          (3, 1, 'Sindbad', 'https://spotify.com/marwanpablo/sindbad'),
          (4, 1, 'CTRL', 'https://spotify.com/marwanpablo/ctrl'),

          (5, 2, 'Mesam3een', 'https://spotify.com/hussien/Mesam3een'),
          (6, 2, 'Dawletna', 'https://spotify.com/hussien/Dawletna'),
          (7, 2, 'Switch', 'https://spotify.com/hussien/Switch'),
          (8, 2, 'Stop(magnolia)', 'https://spotify.com/hussien/Stop(magnolia)'),

          (9, 3, 'Blinding Lights', 'https://spotify.com/theweeknd/blindinglights'),
          (10, 3, 'Save Your Tears', 'https://spotify.com/theweeknd/saveyourtears'),
          (11, 3, 'Starboy', 'https://spotify.com/theweeknd/starboy'),
          (12, 3, 'The Hills', 'https://spotify.com/theweeknd/thehills'),

         (13, 4, 'God’s Plan', 'https://spotify.com/drake/godsplan'),
         (14, 4, 'In My Feelings', 'https://spotify.com/drake/inmyfeelings'),
         (15, 4, 'One Dance', 'https://spotify.com/drake/onedance'),
         (16, 4, 'Hotline Bling', 'https://spotify.com/drake/hotlinebling');

INSERT INTO "follow"("user_id","artist_id")
    VALUES(1,1),
          (1,2),
          (2,3),
          (2,4);

INSERT INTO "playlist" ("id","user_id","playlist_name","song_id")
    VALUES(1,1,'egyptian_songs',1),
          (1,1,'egyptian_songs',2),
          (1,1,'egyptian_songs',3),
          (1,1,'egyptian_songs',4),
          (1,1,'egyptian_songs',5),
          (1,1,'egyptian_songs',6),
          (1,1,'egyptian_songs',7),
          (1,1,'egyptian_songs',8),
          (2,2,'candian_songs',9) ,
          (2,2,'candian_songs',10),
          (2,2,'candian_songs',11),
          (2,2,'candian_songs',12),
          (2,2,'candian_songs',13),
          (2,2,'candian_songs',14),
          (2,2,'candian_songs',15),
          (2,2,'candian_songs',16);

CREATE VIEW "Marwan Pablo songs" AS
    SELECT "song_name" FROM "song"
    JOIN "artists" ON "artist_id" = "artists"."id"
    WHERE "artist_name" = "Marwan Pablo";

CREATE VIEW "Hyssien songs" AS
    SELECT "song_name" FROM "song"
    JOIN "artists" ON "artist_id" = "artists"."id"
    WHERE "artist_name" = "Hyssien";

CREATE VIEW "The weekend songs" AS
    SELECT "song_name" FROM "song"
    JOIN "artists" ON "artist_id" = "artists"."id"
    WHERE "artist_name" = "The weekend";

CREATE VIEW "Drake songs" AS
    SELECT "song_name" FROM "song"
    JOIN "artists" ON "artist_id" = "artists"."id"
    WHERE "artist_name" = "Drake";


