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
