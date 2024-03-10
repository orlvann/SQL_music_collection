--Count of Albums Per Genre
SELECT g.name AS Genre, COUNT(a.ean) AS AlbumsCount
FROM "album-genre" ag
JOIN genres g ON ag.genres_name = g.name
JOIN albums a ON ag.albums_ean = a.ean
GROUP BY g.name
ORDER BY AlbumsCount DESC;

--Total Duration of Tracks for Each Genre
SELECT g.name AS Genre, SUM(mt.duration_seconds) AS TotalDurationSeconds
FROM genres g
JOIN "track-genre" tg ON g.name = tg.genres_name
JOIN musictracks mt ON tg.musictracks_iscr = mt.iscr
GROUP BY g.name
ORDER BY TotalDurationSeconds DESC;

--Albums with Their Genres and Authors
SELECT al.title AS Album, g.name AS Genre, au.stage_name AS Author
FROM albums al
INNER JOIN "album-genre" ag ON al.ean = ag.albums_ean
INNER JOIN genres g ON ag.genres_name = g.name
INNER JOIN "album-author" aa ON al.ean = aa.albums_ean
INNER JOIN authors au ON aa.authors_isni = au.isni
ORDER BY Genre, Album;

--Complete List of Albums and Tracks, Including Orphans
SELECT al.title AS Album, mt.title AS Track
FROM albums al
FULL OUTER JOIN "album-author" aa ON al.ean = aa.albums_ean
FULL OUTER JOIN track_author ta ON aa.authors_isni = ta.authors_isni
FULL OUTER JOIN musictracks mt ON ta.musictracks_iscr = mt.iscr
ORDER BY Album, Track;

--Authors with the Highest Average Track Duration
WITH AuthorTrackDurations AS (
    SELECT au.stage_name, AVG(mt.duration_seconds) AS avg_duration
    FROM authors au
    JOIN track_author ta ON au.isni = ta.authors_isni
    JOIN musictracks mt ON ta.musictracks_iscr = mt.iscr
    GROUP BY au.stage_name
)
SELECT stage_name, avg_duration
FROM AuthorTrackDurations
ORDER BY avg_duration DESC
FETCH FIRST 3 ROWS ONLY;

--Top 5 Most Active Years in Music Production
WITH AlbumYears AS (
    SELECT release_year, COUNT(*) AS num_albums
    FROM albums
    GROUP BY release_year
)
SELECT release_year, num_albums
FROM AlbumYears
ORDER BY num_albums DESC
FETCH FIRST 5 ROWS ONLY;

