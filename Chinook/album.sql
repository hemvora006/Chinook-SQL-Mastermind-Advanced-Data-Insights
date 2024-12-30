CREATE TABLE album(
albumid INT PRIMARY KEY,
title VARCHAR(255),
artistid INT,
FOREIGN KEY (artistid) REFERENCES artist(artistid)
);

/*
Retrieve the top 3 most purchased albums.
*/

SELECT 
        a.title,
        SUM(il.unit_price) AS TotalSales
FROM 
	album a
JOIN
	track t ON a.albumid=t.albumid
JOIN
        invoiceline il ON t.trackid=il.track_id
GROUP BY
        a.albumid
ORDER BY
        TotalSales DESC
LIMIT 3;

/*
Identify the artist with the most albums in the database
*/

SELECT
        ar.artist,
        ar.artistid,
        COUNT(a.albumid) AS TotalAlbums
FROM
        album a
JOIN
        artist ar ON a.artistid=ar.artistid
GROUP BY
        a.artistid
ORDER BY 
        COUNT(a.albumid) DESC
LIMIT 1;





































































