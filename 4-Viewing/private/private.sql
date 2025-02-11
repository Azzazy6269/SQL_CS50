DROP VIEW IF EXISTS "message";
DROP TABLE IF EXISTS "cipher";

CREATE TABLE "cipher" (
    "sentence_id" INTEGER,
    "start_pos" INTEGER,
    "length" INTEGER
);

INSERT INTO "cipher" ("sentence_id", "start_pos", "length") VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

CREATE VIEW "message" AS
SELECT substr("s"."sentence", "c"."start_pos", "c"."length") AS "phrase"
FROM "sentences" AS "s"
JOIN "cipher" AS "c" ON "s"."id" = "c"."sentence_id";

-- cat private.sql | sqlite3 private.db
-- SELECT "phrase" FROM "message" ;
