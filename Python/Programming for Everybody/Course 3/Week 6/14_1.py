##### JSON and the REST Architecture #####
##########################################
## Extracting Data from JSON ##
###############################

# Problem: In this assignment you will write a Python program somewhat similar to http://www.py4e.com/code3/json2.py. The program will prompt for a URL, read the JSON data from that URL using urllib and then parse and extract the comment counts from the JSON data, compute the sum of the numbers in the file and enter the sum below:
# Data Files Provided:
    # File 1 (Test) - http://py4e-data.dr-chuck.net/comments_42.json
        # Expected: Sum = 2553
    # File 2 (Real) - http://py4e-data.dr-chuck.net/comments_1124103.json
        # Expected: Sum ends with 82

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

# Create sum variable
sum = 0
i = 0
flag = True

# Take in URL input
url = input('Enter - ')

# Open XML file from URL
data = urllib.request.urlopen(url)

# Read XML file
data = data.read().decode()

# Read into json format
js = json.loads(data)

#print(json.dumps(js, indent=4))                                                # Debug line

# While loop to iterate through all values
while flag == True:

    # try/except logic to avoid throwing error when index is out of range
    try:
        value = js["comments"][i]["count"]

        # Sum values
        sum = sum + value

        i = i+1

    except:
        break

# Output sum
print(f"Sum: {sum}")
