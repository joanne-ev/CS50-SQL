# 🚨 Don't Panic

## Problem to Solve

You’re a trained “pentester.” Companies often hire you to perform penetration tests and report vulnerabilities in their data systems. Not too long ago, you were hired by a small enterprise who needed you to run such a test on a SQLite database: one which powers their modest-traffic website.

To succeed in this covert operation, you’ll need to…
- Alter the password of the website’s administrative account.
- Erase any logs of the above password change recorded by the database.
- Add false data to throw the company off of your trail.

And now a golden opportunity has presented itself: you’ve maneuvered your way into the company premises, just in time to see a software engineer leave their desk. The engineer’s connection to the database is still open. You estimate you have 5 minutes before they come back. Ready?

## Distribution Code

```zsh
wget https://cdn.cs50.net/sql/2024/x/psets/3/dont-panic.zip
```

There is a database named `dont-panic.db` alongside a `hack.sql` and `reset.sql` file. Executing `sqlite3 dont-panic.db` should open the database.

## Schema

Afraid there’s not much time to explain the database’s schema. Remember you can access a SQLite database’s schema with `.schema`.

## Specification

In `hack.sql`, write a sequence of SQL statements to achieve the following:

- **Alter** the password of the website’s administrative account, `admin`, to instead be “oops!”.
- **Erase** any logs of the above password change recorded by the database.
- **Add** false data to throw others off your trail. In particular, to frame `emily33`, make it only appear—in the `user_logs` table—as if the admin account has had its password changed to `emily33`’s password.

When your SQL statements in `hack.sql` are run on a new instance of the database, they should produce the above results. Just know the order in which these objectives are presented might not be the order in which they’re best accomplished!

Also keep in mind that passwords are usually not stored “in the clear”—that is, as the plain characters that make up the password. Instead they’re “hashed,” or scrambled, to preserve privacy. Given this reality, you’ll need to ensure the password to which you change the administrative password is also hashed. Thankfully, you know that the passwords in the users table are already stored as MD5 hashes. You can generate quickly generate such hashes from plaintext at [md5hashgenerator.com](https://www.md5hashgenerator.com/).

Clock’s ticking!

### Hints

- Recall you can `INSERT` into a table the rows returned by a `SELECT` statement, so long as the number of columns matches.
- You can create a subquery at any point in a SQL statement, not just as part of a `WHERE` clause. For instance, consider the following SQL query on a simplified `user_logs` table:
    ```SQL
    INSERT INTO "user_logs" ("type", "password")
    SELECT 'update', (
        SELECT "password"
        FROM "users"
        WHERE "username" = 'carter'
    );
    ```

The above query will insert a new row into the `user_logs` table. The column type will have the value “update” and the column password will have the current password of the user carter.
