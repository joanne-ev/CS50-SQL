# ☄️ Meteorite Cleaning

## Problem to Solve

As a data engineer at NASA, you often spend your time cleaning meteorites—or at least the data they create.

You’ve been given a CSV file of historical meteorite landings here on Earth, of which there are quite a few! Your job is to import the data into a SQLite database, cleaning it up along the way. After you’re done, the database will be used in analyses by some of your fellow engineers.

## Distribution Code

For this problem, you’ll need to download `meteorites.csv`, along with an `import.sql` file in which you’ll write SQL statements to clean the CSV.

```zsh
wget https://cdn.cs50.net/sql/2024/x/psets/3/meteorites.zip
```

There will be a a CSV file named `meteorites.csv` alongside an `import.sql` file

## Specification

In `import.sql`, write a series of SQL (and SQLite) statements to import and clean the data from `meteorites.csv` into a table, `meteorites`, in a database called `meteorites.db`.

Within `meteorites.db`, the meteorites table should have the following columns:

- `id`, which represents the unique ID of the meteorite.
- `name`, which represents the given name of the meteorite.
- `class`, which is the classification of the meteorite, according to the traditional classification scheme.
- `mass`, which is the weight of the meteorite, in grams.
- `discovery`, which is either “Fell” or “Found”. “Fell” indicates the meteorite was seen falling to Earth, whereas “Found” indicates the meteorite was found only after landing on Earth.
- `year`, which is the year in which the the meteorite was discovered.
- `lat`, which is the latitude at which the meteorite landed.
- `long`, which is the longitude at which the meteorite landed.

Keep in mind that not all columns in the CSV should end up in the final table!

To consider the data in the `meteorites` table clean, you should ensure…
1. Any empty values in `meteorites.csv` are represented by `NULL` in the `meteorites` table.
    - Keep in mind that the `mass`, `year`, `lat`, and `long` columns have empty values in the CSV.
2. All columns with decimal values (e.g., 70.4777) should be rounded to the nearest hundredths place (e.g., 70.4777 becomes 70.48).
    - Keep in mind that the `mass`, `lat`, and `long` columns have decimal values.
3. All meteorites with the nametype “Relict” are not included in the meteorites table.
4. The meteorites are sorted by `year`, oldest to newest, and then—if any two meteorites landed in the same year—by `name`, in alphabetical order.
5. You’ve updated the IDs of the meteorites from `meteorites.csv`, according to the order specified in #4.
    - The `id` of the meteorites should start at 1, beginning with the meteorite that landed in the oldest year and is the first in alphabetical order for that year.
