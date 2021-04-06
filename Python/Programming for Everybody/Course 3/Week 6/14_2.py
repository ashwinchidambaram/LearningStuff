##### JSON and the REST Architecture #####
##########################################
## Calling a JSON API ##
########################

# Problem: In this assignment you will write a Python program somewhat similar to http://www.py4e.com/code3/geojson.py. The program will prompt for a location, contact a web service and retrieve JSON for the web service and parse that data, and retrieve the first place_id from the JSON. A place ID is a textual identifier that uniquely identifies a place as within Google Maps.
# API Provided:
    # Use - http://py4e-data.dr-chuck.net/json?


####################################################

# Import necessary libraries for Web Scraping
import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET
import ssl
import json

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# API Endpoint URL
api_key = 42
serviceurl = 'http://py4e-data.dr-chuck.net/json?'

while True:

    # Take in location input
    address = input('Enter Location - ')

    search = dict()
    search['address'] = address
    search['key'] = api_key

    # Get encoded url
    url = serviceurl + urllib.parse.urlencode(search)

    print('Retrieving', url)

    # Open XML file from URL
    data = urllib.request.urlopen(url, context=ctx)

    # Read XML file
    data = data.read().decode()

    # Read into json format
    js = json.loads(data)

    #print(json.dumps(js, indent=4))                                                # Debug line

    placeID = js["results"][0]['place_id']
    print("Place ID:", placeID)

    break
