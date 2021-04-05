###########################################
##### Using Python to Access Web Data #####
###########################################
## Extracting Data from XML ##
##############################

# Problem: In this assignment you will write a Python program somewhat similar to http://www.py4e.com/code3/geoxml.py. The program will prompt for a URL, read the XML data from that URL using urllib and then parse and extract the comment counts from the XML data, compute the sum of the numbers in the file.
    # File 1 (Test) - http://py4e-data.dr-chuck.net/comments_42.xml
        # Expected: Sum = 2553
    # File 2 (Real) - http://py4e-data.dr-chuck.net/comments_1124102.xml
        # Expected: Sum ends with 99

####################################################

# Import necessary libraries for Web Scraping
import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET
import ssl

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# Create sum variable
sum = 0
i = 0

# Take in URL input
url = input('Enter - ')

# Open XML file from URL
data = urllib.request.urlopen(url, context=ctx)

# Read XML file
data = data.read()

# Create tree
tree = ET.fromstring(data)

# Find all areas where comment tag is mentioned
results = tree.findall('.//comment')

# Grab all values and sum
for item in results:
    while i < len(results):

        # Find value at [i]
        value = results[i].find('count').text

        value = int(value)
        sum = sum + value

        i = i + 1

# Output sum
print(f"Sum: {sum}")
