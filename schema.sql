-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represent products in the store
CREATE TABLE "products" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "price" NUMERIC NOT NULL CHECK("price" >= 0),
    "supplier_id" INTEGER,
    FOREIGN KEY("supplier_id") REFERENCES "suppliers"("id")
);

-- Represent customers
CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "joined_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Represent orders placed by customers
CREATE TABLE "orders" (
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER,
    "order_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

-- Represent items in each order
CREATE TABLE "order_items" (
    "id" INTEGER PRIMARY KEY,
    "order_id" INTEGER,
    "product_id" INTEGER,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("product_id") REFERENCES "products"("id")
);

-- Represent suppliers providing products
CREATE TABLE "suppliers" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "contact_email" TEXT NOT NULL UNIQUE
);

-- Create indexes to speed common searches
CREATE INDEX "product_name_search" ON "products" ("name");
CREATE INDEX "customer_email_search" ON "customers" ("email");

