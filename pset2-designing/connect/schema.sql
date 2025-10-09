CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE education (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "location" TEXT,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE companies (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);


CREATE TABLE connections (
    "id" INTEGER,
    "user_id" INTEGER,
    "education_id" INTEGER,
    "education_start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "education_end_date" NUMERIC,
    "degree" TEXT,
    "company_id" INTEGER,
    "company_start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "company_end_date" NUMERIC,
    "title" TEXT,
    FOREIGN KEY("user_id") REFERENCES users("id"),
    FOREIGN KEY("education_id") REFERENCES education("id"),
    FOREIGN KEY("company_id") REFERENCES companies("id")
);
