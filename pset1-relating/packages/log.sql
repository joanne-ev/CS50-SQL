-- *** The Lost Letter ***

/*

At what type of address did the Lost Letter end up?:
At what address did the Lost Letter end up?:

- From: 900 Somerville Avenue
- Content: Letter
- To: 2 Finnegan Street

1. Find ID of the 'from' address [addresses]
2. Find the ID of the 'to' address [packages]
3. Find the name and type of the 'to' address [addresses]

*/


-- Find the name and type of the 'to' address
SELECT "address", "type" FROM addresses
WHERE "id" = (
    -- Find the ID of the 'to' address that was sent a letter
    SELECT "to_address_id" FROM packages
    WHERE "contents" LIKE '%letter%'
    AND "from_address_id" = (
        -- Find ID of the 'from' address
        SELECT "id" FROM addresses
        WHERE "address" = '900 Somerville Avenue'
    )
);


-- *** The Devious Delivery ***

/*

At what type of address did the Devious Delivery end up?:
What were the contents of the Devious Delivery?:

- From: NULL
- Contents: Duck

1. Find ID and contents of the package without a 'from' address [packages]
2. Find ID of the address [scans]
3. Find type of address where the package was dropped off [addresses]

*/

-- Find contents of the package without a 'from' address
SELECT "contents" FROM packages
WHERE "from_address_id" IS NULL;


-- Find type of address where the package was dropped
SELECT "type" FROM addresses
WHERE "id" = (
    -- Find ID of the address where the package was dropped
    SELECT "address_id" FROM scans
    WHERE "package_id" = (
        -- Find ID of the package without a 'from' address
        SELECT "id" FROM packages
        WHERE "from_address_id" IS NULL
    )
    AND "action" = 'Drop'
);

-- *** The Forgotten Gift ***

/*
What are the contents of the Forgotten Gift?: Flowers
Who has the Forgotten Gift?:

- From: 109 Tileston Street
- To: 728 Maple Place
- Delayed: 7 days

1. Find from address ID [addresses]
2. Find to address ID [addresses]
3. Find package ID [packages]
4. Find the package contents [packages]
5. Find the driver ID who picked up the package [scans]
6. Find the driver's name [drivers]

*/

-- Find the from address ID = 9873
SELECT "id" AS "Pickup Address"
FROM addresses
WHERE "address" = '109 Tileston Street';

-- Find the to address ID = 4983
SELECT "id" AS "Dropoff Address"
FROM addresses
WHERE "address" = '728 Maple Place';

-- Find package ID and contents = 9523, Flowers
SELECT "id", "contents"
FROM packages
WHERE "from_address_id" = 9873 AND "to_address_id" = 4983;

-- Find the driver ID who picked up the package = 17
SELECT "package_id", "driver_id", "address_id", "action", "timestamp"
FROM scans
WHERE "package_id" = 9523 AND "action" = 'Pick';

-- Find the driver's name
SELECT "name"
FROM drivers
WHERE "id" = 17;
