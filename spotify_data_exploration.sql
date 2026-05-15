-- spotify_data_exploration.sql
-- author: Stutie Banerjie
-- desc: data exploration script

-- (0): getting started
-- see full database
SELECT *
FROM Spotify_Data_Analysis..combined
ORDER BY 1

-- (1): how much data can be used
-- see how many tracks there are in total
SELECT COUNT(*) AS total_num_tracks
FROM Spotify_Data_Analysis..combined

-- see how many tracks are songs
SELECT COUNT(*) AS song_tracks
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null

-- see how many tracks are not songs
SELECT COUNT(*) AS not_song_tracks
FROM Spotify_Data_Analysis..combined
WHERE track_title is null

-- we will only be exploring songs
SELECT *
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
ORDER BY 1

-- (2) top artists through the years
-- top listened to artists (by song)
SELECT TOP 25 
track_album_name as song_artist, COUNT(*) as total_songs_listened
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
GROUP BY track_album_name
ORDER BY total_songs_listened DESC

-- top listened to artists (by minutes)
SELECT TOP 25 
track_album_name as song_artist, ROUND((SUM(ms_played)/60000),0) as total_minutes_listened
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
GROUP BY track_album_name
ORDER BY total_minutes_listened DESC

-- (3) top songs through the years
-- top listened to songs (by minutes)
SELECT TOP 25 
track_title as song_title,  track_album_name AS artist, ROUND((SUM(ms_played)/60000),0) as total_minutes_listened
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
GROUP BY track_title, track_album_name
ORDER BY total_minutes_listened DESC

-- (4) song stats based on geographical location
-- # of songs & # of minutes listened by country
SELECT 
	country_streamed,
	COUNT(*) as total_songs_listened,
	ROUND((SUM(ms_played)/60000),0) as total_minutes_listened
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
GROUP BY country_streamed
ORDER BY total_songs_listened DESC

-- most listened to song in each country

-- create temporary song_totals table
WITH song_totals AS (	
	SELECT 
		country_streamed,
		track_title,
		ROUND((SUM(ms_played)/60000),0) AS total_min
	FROM Spotify_Data_Analysis..combined
	WHERE track_title is not null
	GROUP BY 
		country_streamed,
		track_title
),

-- provides each song in each country a rank number (rn) BY COUNTRY
ranked_songs AS (
	SELECT *,
		ROW_NUMBER() OVER (
			PARTITION BY country_streamed
			ORDER BY total_min DESC
		) AS rn
	FROM song_totals
)

-- select song with rank number 1 for EACH COUNTRY
SELECT
	country_streamed AS country,
	track_title AS song_name
FROM ranked_songs
WHERE rn = 1;


-- (5) understanding variables for later analysis
-- unique values in column reason_start
SELECT reason_start, COUNT(*) as num_of_actions
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
GROUP BY reason_start
ORDER BY num_of_actions DESC

-- unique values in column reason_end
SELECT reason_end, COUNT(*) as num_of_actions
FROM Spotify_Data_Analysis..combined
WHERE track_title is not null
GROUP BY reason_end
ORDER BY num_of_actions DESC



