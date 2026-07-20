from dotenv import load_dotenv 
import os
import base64
from requests import post
import json
import spotipy

# step 1: load environment variables
load_dotenv()

client_id = os.getenv("CLIENT_ID")
client_secret = os.getenv("CLIENT_SECRET")

# step 2: get spotify authorization token
def get_token():
    
    # base 64 encode string combination of client ID and client secret key
    auth_string = client_id + ":" + client_secret
    auth_bytes = auth_string.encode("utf-8")
    auth_base64 = str(base64.b64encode(auth_bytes), "utf-8")
    
    # configure api request
    url = "https://accounts.spotify.com/api/token"              # endpoint
    headers = {                                                 # authentification
        "Authorization": "Basic " + auth_base64,
        "Content-Type": "application/x-www-form-urlencoded"
    }
    data = {"grant_type": "client_credentials"}                 # request data
    
    # send auth token request
    result = post(url, headers = headers, data = data)
    
    # json conversion
    json_result = json.loads(result.content)
    
    # isolate token in result dictionary
    token = json_result["access_token"]
    
    return token

token = get_token()
print(token)

# step 3: construct header for future requests
def get_auth_header(token):
    return {"Authorization": "Bearer" + token}

# step 4: try to find information about a song


