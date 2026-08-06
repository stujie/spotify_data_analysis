# combine_json.py
# author: Stutie Banerjie
# description: combine multiple json files into one json file 

import json
import glob

# store all records from every json file
combined = []

# list files holds individual json files
files = glob.glob("my_spotify_data/Spotify Extended Streaming History/JSON_to_XLSX/*.json")
# check to see if correct pathway
print(files) 

# loop through each file
for file in files:
    # open each json file
    with open(file, "r", encoding="utf-8") as f:
        # load json content into combined list
        combined.extend(json.load(f))

# check total rows in json list
print("Total rows:", len(combined))

# write contents of combined list into new JSON file
with open("combined.json", "w", encoding="utf-8") as f:
    # json formatting
    json.dump(combined, f, indent=2)
