CREATE TABLE "Ingredients"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "price_per_unit" REAL NOT NULL,
    "unit_of_weight" TEXT NOT NULL
);

CREATE TABLE "Donuts"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten_free" BOOLEAN NOT NULL CHECK("is_gluten_free"IN(0,1)),
    "price" REAL NOT NULL
);

CREATE TABLE "Donut_Ingredient"(
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    PRIMARY KEY ("donut_id","ingredient_id"),
    FOREIGN KEY ("donut_id") REFERENCES "Donuts"("id") ON DELETE CASCADE,
    FOREIGN KEY ("ingredient_id") REFERENCES "Ingredients"("id") ON DELETE CASCADE
);

CREATE TABLE "customers"(
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);


CREATE TABLE "Orders"(
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL ,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE CASCADE
);

CREATE TABLE "Order_Donut"(
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL CHECK("quantity">0),
    PRIMARY KEY ("order_id","donut_id"),
    FOREIGN KEY ("donut_id") REFERENCES "Donuts"("id") ON DELETE CASCADE,
    FOREIGN KEY ("order_id") REFERENCES "Orders"("id") ON DELETE CASCADE
);


INSERT INTO "Ingredients" ("id","name","price_per_unit","unit_of_weight") VALUES
    (1,'Cocoa',5.00,'pound'),
    (2,'Sugar',2.00,'pound'),
    (3,'Flour',3.00,'packet'),
    (4,'Buttermilk',3.80,'pound'),
    (5,'Sprinkles',1.40,'packet');

INSERT INTO "Donuts"("id","name","is_gluten_free","price")VALUES
    (1,'Belgian Dark Chocolate',0,4.00),
    (2,'Back-To-School Sprinkles',0,4.00);

INSERT INTO "Donut_Ingredient"("donut_id","ingredient_id")VALUES
    (1,1),
    (1,2),
    (1,3),
    (1,4),
    (2,2),
    (2,3),
    (2,4),
    (2,5);

INSERT INTO "customers"("id","first_name","last_name")VALUES
    (1,'Luis','Singh');

INSERT INTO "Orders"("id","customer_id")VALUES
    (1,1);

INSERT INTO "Order_Donut"("order_id","donut_id","quantity")VALUES
    (1,1,3),
    (1,2,2);


