# A Decade of Music: Analyzing Spotify Data
This project explores the past 10 years of my personal Spotify music data. 

All processes & files created/used for sourcing, cleaning, exploration, analysis, and visualization will be highlighted and documented here.

## Methodology
Below is an overview of the software & languages used alongside a step-by-step breakdown of each step of data mangagement, including the workflow decisions & troubleshooting involved.

Will be updated as project progress is made.

### Tech Used
Microsoft Excel, Python, Microsoft SQL, Jupyter Notebook

## Part 1: Spotify Provided Data

### Goal:

### Data Sourcing
- Requested and downloaded personal my personal history directly from [Spotify](https://support.spotify.com/us/article/data-rights-and-privacy-settings/).
- Transformed received JSON files into an XLSX file
  - Wrote [combine_json.py](https://github.com/stujie/spotify_data_analysis/blob/main/combine_json.py) to consolidate all JSON files into a single file to make JSON to XLSX process simpler.

### Data Exploration
- Created an [MS SQL](https://github.com/stujie/spotify_data_analysis/blob/main/spotify_data_exploration.sql) script to explore data before deeper analysis.
- First, dataset was briefly reviewed to understand how much of the raw data could be used.
  - As around 900 rows were non-song related data, these rows will be discarded in the data cleaning stage of this process.
- Next, choice summaries of the data were explored in order to better understand the variables and structure of the dataset. 
  - Interesting find: Rankings for music can change depending on metric (minutes played, songs listened, etc.) used.

### Data Visualization
![Tableau Board](https://github.com/stujie/spotify_data_analysis/blob/74a79ec92e40fb271443676abaf3ba17caf2d897/TableauBoard.png)

Here is an alternative link to my [Tableau Public page](https://public.tableau.com/shared/4K5PC238M?:display_count=n&:origin=viz_share_link).

## Part 2: API Sourced Data

### Goal:

### Data Cleaning

- I started data cleaning by unifying all column headers to be the same format.
- Next, I altered column names with vague titles, combined similar categorical data types, and changed column data types in order to make it easier to understand and use in the future.
- I performed a few logic checks throughout the data in order tot make sure there was no impossible data inputs.
  - For example, I made sure that there were no songs that were listened to for negative seconds.
- Following, I removed tracks that were audiobooks and podcasts (not songs).
- Lastly, I identified a list of [unique songs](https://github.com/stujie/spotify_data_analysis/blob/main/5_find_unique_songs.ipynb) I've listened to. This was to understand which tracks I would have to find track analysis data for.

### Data Sourcing
- Due to Spotify's API deprecation, I turned [Rapid API Track Analysis API](https://rapidapi.com/soundnet-soundnet-default/api/track-analysis) to collect audio analysis data for each of the unique songs I've listened to.
- I wrote a [python script]() to automate my API Calls and save the received data in a csv file.
  
***

## Resources Used
Throughout this journey, I had a lot to learn. Here are the videos/articles that helped me the most!
### Videos
* [Youtube: Alex the Analyst](https://www.youtube.com/playlist?list=PLUaB-1hjhk8H48Pj32z4GZgGWyylqv85f)
### Articles
* [Geeks For Geeks: Types of Data Visualization](https://www.geeksforgeeks.org/r-language/types-of-data-visualization/)
