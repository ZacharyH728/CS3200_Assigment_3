INSERT INTO Music_Video(videoDirector, trackId)
    SELECT 'director11', trackId
    FROM tracks
    WHERE Name == 'Voodoo';