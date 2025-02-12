--UPDATE passwords
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

UPDATE "users"
SET "password" = 'e82c138ff1e38744b73d510da3d8d185'
WHERE "username" = 'dalila20';

UPDATE "users"
SET "password" = '18630c2d0c6a1c1862b5b5a2869ef342'
WHERE "username" = 'aaron13';

UPDATE "users"
SET "password" = '2136622ffb4269f1fdb6264266b4711b'
WHERE "username" = 'erin28';
------------------------------------------------
--DELETE user_logs
DELETE FROM "user_logs"
WHERE "old_username" = 'admin';

DELETE FROM "user_logs"
WHERE "old_username" = 'dalila20';

DELETE FROM "user_logs"
WHERE "old_username" ='aaron13';

DELETE FROM "user_logs"
WHERE "username" = 'erin28';

DELETE FROM "user_logs"
WHERE "type" = 'update'; --for Ensuring
------------------------------------------------
--INSERT flase date for misleading
INSERT INTO "user_logs" ("type","old_username","new_username","old_password","new_password")
VALUES('update','admin','admin','e10adc3949ba59abbe56e057f20f883e','44bf025d27eea66336e5c1133c3827f7');

INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT
    'update',
    'dalila20',
    'dalila20',
    (SELECT "password" FROM "users" WHERE "username" = 'dalila20'),
    (SELECT "password" FROM "users" WHERE "username" = 'zad28');

INSERT INTO "user_logs"("type", "old_username", "new_username", "old_password", "new_password")
SELECT
     'update',
     'aaron13',
     'aaron13',
     (SELECT "password" FROM "users" WHERE "username" = 'aaron13'),
     (SELECT "password" FROM "users" WHERE "username" = 'patrick20');

INSERT INTO "user_logs" ("type","old_username","new_username","old_password","new_password")
SELECT
     'update',
     'erin28',
     'erin28',
     (SELECT "password" FROM "users" WHERE "username" = 'erin28'),
     (SELECT "password" FROM "users" WHERE "username" = 'vanessa2');

--WRONG SYNTAX
--INSERT INTO "user_logs" ("type","old_username","new_username","old_password","new_password")
--VALUES('update','dalila20','dalila20',SELECT "passowrd" FROM "users" WHERE "username" = 'dalila20',SELECT "passowrd" FROM "users" WHERE "username" = 'zad28');
