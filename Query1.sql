-- Creates a new table named Music_Video that is a track

CREATE TABLE Music_Video (
    music_video_Id INTEGER PRIMARY KEY AUTOINCREMENT,
    videoDirector TEXT,
    trackId INTEGER Not NULL,
    FOREIGN KEY (trackId) REFERENCES tracks(TrackId)
);

