-- lists the top three albums by total sales
SELECT album.Title AS albums, album.ArtistId, SUM(invoice_item.Quantity) AS sold
FROM albums album
JOIN tracks track ON album.AlbumId = track.AlbumId
JOIN invoice_items invoice_item ON track.TrackId = invoice_item.TrackID
    GROUP BY album.AlbumId
        ORDER BY sold DESC
        -- grabs top three
        LIMIT 3;
