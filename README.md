# A Decade of Music: Analyzing Spotify Data
This project explores the past 10 years of my personal Spotify music data. 

All processes & files created/used for sourcing, cleaning, exploration, analysis, and visualization will be highlighted and documented here.

## Methodology
Below is an overview of the software & languages used alongside a step-by-step breakdown of each step of data mangagement, including the workflow decisions & troubleshooting involved.

Will be updated as project progress is made.

### Tech Used
Microsoft Excel, Python, Microsoft SQL

### Data Sourcing
- Requested and downloaded personal my personal history directly from [Spotify](https://support.spotify.com/us/article/data-rights-and-privacy-settings/).
- Transformed received JSON files into an XLSX file
  - Wrote [combine_json.py](https://github.com/stujie/spotify_data_analysis/blob/main/combine_json.py) to consolidate all JSON files into a single file to make JSON to XLSX process simpler.

### Data Exploration
- To start, dataset was briefly reviewed to understand how much of the raw data could be used.
  - As around 900 rows were non-song related data, these rows will be discarded in the data cleaning stage of this process.
- Next, choice summaries of the data were explored in order to better understand the variables and structure of the dataset. 
  - Interesting find: Rankings for music can change depending on metric (minutes played, songs listened, etc.) used.

### Data Visualization
- Tableau:
