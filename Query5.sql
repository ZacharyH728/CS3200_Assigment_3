-- lists all tracks that are not in one of the top 5 genres with longer durations
SELECT track.Name
    AS Track, genre.Name
        AS Genre
FROM tracks track
JOIN genres genre
    ON genre.GenreId = track.GenreId
WHERE genre.GenreId NOT IN (
    SELECT GenreId
    -- grabs the top 5 genres
    FROM (SELECT genre.GenreId, AVG(track.Milliseconds)
            as AverageTime
        FROM tracks track
        JOIN genres genre
            ON track.GenreId = genre.GenreId
        GROUP BY genre.GenreId
        ORDER BY AverageTime DESC
        -- grabs only top 5
        LIMIT 5
    )
);

--used templates provided from gpt-4 as example
--prompt "how to use where with another select statement inside in sqlite"
--
-- Sure, to use a `WHERE` clause with another `SELECT` statement inside in SQLite (or in SQL in general), you would typically use a subquery. Here's an example:
--
-- ```sql
-- SELECT column_name(s)
-- FROM table1
-- WHERE column_name IN (
--     SELECT column_name
--     FROM table2
-- );
-- ```
--
-- In this particular case, `table1` is the main table you're selecting data from, `column_name(s)` are the column(s) you're interested in from that table, `table2` is a different table and `column_name` is the column in that table you're using for comparison with the columns in `table1`.
--
-- This statement will select the column(s) you're interested in from `table1` where the corresponding value in `column_name` appears in the select statement from `table2`.

-- prompt: "how to ues groupby in sqlite"
--
-- The `GROUP BY` statement in SQLite is used with aggregate functions like `COUNT()`, `MAX()`, `MIN()`, `SUM()`, `AVG()`, etc., to group the result-set by one or more columns.
--
-- Here's a simple example:
--
-- ```sql
-- SELECT column_name1, COUNT(column_name2)
-- FROM table_name
-- GROUP BY column_name1;
-- ```
--
-- In this example, it groups `table_name` by `column_name1`, and for each group, it counts the number of entries in `column_name2`.
--
-- You would substitute `table_name`, `column_name1`, and `column_name2` with your actual table and column names.
--
-- You can also use `GROUP BY` with multiple columns:
--
-- ```sql
-- SELECT column_name1, column_name2, AVG(column_name3)
-- FROM table_name
-- GROUP BY column_name1, column_name2;
-- ```
--
-- This groups `table_name` by both `column_name1` and `column_name2`, and for each group combination, it computes the average of `column_name3`.
--
-- Please replace `column_name1`, `column_name2`, `column_name3`, and `table_name` with your own column and table names.