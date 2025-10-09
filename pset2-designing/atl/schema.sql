CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE checkins (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES passengers("id")
    FOREIGN KEY("flight_id") REFERENCES flights("id")
);

CREATE TABLE airlines(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE flights(
    "id" INTEGER,
    "number" INTEGER,
    "airline_id" INTEGER,
    "departing_airport" TEXT NOT NULL,
    "arrival_airport" TEXT NOT NULL,
    "departure_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES airlines("id")
);
