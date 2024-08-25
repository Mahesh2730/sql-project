-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find all products supplied by a specific supplier
SELECT * FROM "products" WHERE "supplier_id" = (
    SELECT "id" FROM "suppliers" WHERE "name" LIKE 'TRAWOC'
);

-- Find all orders placed by a specific customer
SELECT * FROM "orders"
WHERE "customer_id" IN (
    SELECT "id" FROM "customers"
    WHERE "email" = 'maheshvardhan@.com'
);

-- Find all items in a specific order
SELECT * FROM "order_items"
WHERE "order_id" = (
    SELECT "id" FROM "orders"
    WHERE "id" = 1
);

-- Add a new product
INSERT INTO "products" ("name", "description", "price", "supplier_id")
VALUES ('Facewash', 'To Treat Acne', 590, 1);

-- Add a new customer
INSERT INTO "customers" ("first_name", "last_name", "email")
VALUES ('Mahesh', 'Vardhan', 'maheshvardhan@gmail.com');

-- Record a new order
INSERT INTO "orders" ("customer_id", "status")
VALUES (1, 'Processing');

-- Add an item to an order
INSERT INTO "order_items" ("order_id", "product_id", "quantity")
VALUES (1, 1, 2);
