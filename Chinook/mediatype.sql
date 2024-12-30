CREATE TABLE mediatype(
mediatype INT PRIMARY KEY,
name VARCHAR(255)
);

/*
Find the number of tracks available for each media type
*/

SELECT
        mt.name,
        COUNT(*) AS TracksPerMediaType
FROM
        mediatype mt
JOIN
        track t ON mt.mediatype=t.mediatypeid
GROUP BY
        mt.mediatype;