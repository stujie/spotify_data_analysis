-- see full database
SELECT *
FROM Spotify_Data_Analysis..combined
ORDER BY 1

-- see how many tracks there are in total
SELECT COUNT(*)
FROM Spotify_Data_Analysis..combined

-- see how many tracks are songs
SELECT COUNT(*)
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null

-- see how many tracks are not songs
SELECT COUNT(*)
FROM Spotify_Data_Analysis..combined
WHERE track_title is null

-- we will only be exploring songs
SELECT *
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
ORDER BY 1

-- top listened to artists (by song)
SELECT TOP 25 
track_album_name, COUNT(*) as artist_listened
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
GROUP BY track_album_name
ORDER BY artist_listened DESC

