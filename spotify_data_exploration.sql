-- see full database
SELECT *
FROM Spotify_Data_Analysis..combined
ORDER BY 1

-- see which entries are not songs
SELECT *
FROM Spotify_Data_Analysis..combined
WHERE track_title is null

-- delete non-song entries
DELETE
FROM Spotify_Data_Analysis..combined
WHERE track_title is null

-- see new database
SELECT *
FROM Spotify_Data_Analysis..combined
ORDER BY 1

-- add unique identifiers column
ALTER TABLE Spotify_Data_Analysis..combined
ADD ID INT IDENTITY(1,1)

-- check to make sure id column works
SELECT ID, time_stamp,track_title 
FROM Spotify_Data_Analysis..combined

-- add year, month, day, and time_ust columns
ALTER TABLE Spotify_Data_Analysis..combined
ADD year VARCHAR(4),
	month VARCHAR(2),
	day VARCHAR(2),
	time_ust VARCHAR(8)

-- extract year, month, day, and time (ust) from time_stamp
UPDATE Spotify_Data_Analysis.dbo.combined
SET year = SUBSTRING(time_stamp,1,4),
    month = SUBSTRING(time_stamp,6,2),
    day = SUBSTRING(time_stamp,9,2),
    time_ust = SUBSTRING(time_stamp,12,8)

-- check to make sure year, month, day and time columns work
SELECT ID, year, month, day, time_ust, track_title
FROM Spotify_Data_Analysis..combined
ORDER BY ID

-- select all relevant columns in data
SELECT ID, year, month, day, time_ust,
	   streaming_platform, ms_played, country_streamed, track_title, 
	   track_album_name as track_artist, track_album_name2 as track_album, 
	   track_spotify_url, reason_start, reason_end, shuffle, skipped, 
	   offline, incognito_mode
FROM Spotify_Data_Analysis..combined
ORDER BY ID

-- add season column
ALTER TABLE Spotify_Data_Analysis..combined
ADD season VARCHAR(8)

-- populate season column based on month of row
UPDATE Spotify_Data_Analysis..combined
SET season = 
	CASE
		WHEN month IN ('01','02','03') THEN 'Winter'
		WHEN month IN ('04','05','06') THEN 'Spring'
		WHEN month IN ('07','08','09') THEN 'Summer'
		WHEN month IN ('10','11','12') THEN 'Autumn'
	END

-- select all relevant columns in data
SELECT ID, year, month, day, time_ust, season,
	   streaming_platform, ms_played, country_streamed, track_title, 
	   track_album_name as track_artist, track_album_name2 as track_album, 
	   track_spotify_url, reason_start, reason_end, shuffle, skipped, 
	   offline, incognito_mode
FROM Spotify_Data_Analysis..combined
ORDER BY ID

-- see distinct platforms 
SELECT streaming_platform, COUNT(*) AS total_rows
FROM Spotify_Data_Analysis.dbo.combined
GROUP BY streaming_platform
ORDER BY total_rows desc

-- see distinct countries
SELECT country_streamed, COUNT(*) AS total_rows
FROM Spotify_Data_Analysis.dbo.combined
GROUP BY country_streamed
ORDER BY total_rows desc