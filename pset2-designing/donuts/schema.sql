CREATE TABLE ingredients(
    "id" INTEGER,
    "name" TEXT UNIQUE,
    "price" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE donuts(
    "id" INTEGER,
    "name" INTEGER UNIQUE NOT NULL,
    "gluten" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "ingredient_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredient_id") REFERENCES ingredients("id")
);

CREATE TABLE orders(
    "id" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("donut_id") REFERENCES donuts("id"),
    FOREIGN KEY("customer_id") REFERENCES customers("id")
);

CREATE TABLE customers(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    "order_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("order_id") REFERENCES orders("id")
);
