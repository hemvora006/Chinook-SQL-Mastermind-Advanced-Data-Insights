CREATE TABLE track(
trackid INT PRIMARY KEY,
name VARCHAR(255),
albumid INT,
mediatypeid INT,
genreid INT,
composer VARCHAR(255),
millisecods BIGINT,
bytes BIGINT,
unitprice VARCHAR(10),
FOREIGN KEY (albumid) REFERENCES album(albumid),
FOREIGN KEY (mediatypeid) REFERENCES mediatype(mediatype),
FOREIGN KEY (genreid) REFERENCES genre(genreid)
);

/*
Display the top 3 most popular genres based on the total number of tracks sold.
*/

SELECT
        t.genreid,
        g.name,
        SUM(il.unit_price) AS TotalSales
FROM
        track t
JOIN
		genre g ON t.genreid = g.genreid
JOIN
		invoiceline il ON t.trackid = il.track_id
GROUP BY 
		t.genreid
ORDER BY
		TotalSales DESC
LIMIT 3;

/*
Retrieve the genre with the highest revenue and its total sales
*/        

SELECT
        t.genreid,
        g.name,
        SUM(il.unit_price) AS TotalSales
FROM
        track t
JOIN
        genre g ON t.genreid = g.genreid
JOIN
	invoiceline il ON t.trackid = il.track_id
GROUP BY 
	t.genreid
ORDER BY
	TotalSales DESC
LIMIT 1;

/*
Determine the average number of tracks per album, 
and identify albums with track counts above this average  
*/

WITH NumberOfTracks AS(
        SELECT
                t.albumid,
                a.title,
                COUNT(t.trackid) AS NumberOfTrack
        FROM
                track t
        JOIN
                album a ON t.albumid=a.albumid
        GROUP BY
                t.albumid
),
AverageTrackPerAlbum AS(
        SELECT
                AVG(nt.NumberOfTrack) AS AverageTracks
        FROM
                NumberOfTracks nt
)

SELECT
        nt.albumid,
        nt.title,
        nt.NumberOfTrack
FROM
        NumberOfTracks nt
CROSS JOIN
        AverageTrackPerAlbum ata
WHERE
        nt.NumberOfTrack>ata.AverageTracks;

/*
Find the longest track in the database, its artist, and album
*/

SELECT
        MAX(t.millisecods) AS Duration,
        at.artist,
        a.title
FROM
        track t
JOIN
        album a ON t.albumid = a.albumid
LEFT JOIN
        artist at ON a.artistid = at.artistid
GROUP BY
        at.artist, a.title, a.albumid
ORDER BY
        Duration DESC
LIMIT 1;


















































