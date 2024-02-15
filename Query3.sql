-- inserts a music_video tuple with the trackId from the track named Voodoo
INSERT INTO Music_Video(videoDirector, trackId)
    SELECT 'director11', trackId
    FROM tracks
    WHERE Name == 'Voodoo';