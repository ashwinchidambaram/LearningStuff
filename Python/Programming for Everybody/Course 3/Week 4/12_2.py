##### Scraping HTML Data with BeautifulSoup #####
#################################################
## Following Links in Python ##
###############################

# Problem: In this assignment you will write a Python program that expands on http://www.py4e.com/code3/urllinks.py. The program will use urllib to read the HTML from the data files below, extract the href= vaues from the anchor tags, scan for a tag that is in a particular position relative to the first name in the list, follow that link and repeat the process a number of times and report the last name you find.
# Data Files Provided:
    # File 1 (Test) - http://py4e-data.dr-chuck.net/known_by_Fikret.html
        # Find the link at position 3 (the first name is 1).
        #   Follow that link. Repeat this process 4 times.
        #   The answer is the last name that you retrieve.

        # Sequence of names: Fikret Montgomery Mhairade Butchi Anayah
        # Expected: Anayah

    # File 2 (Real) -  http://py4e-data.dr-chuck.net/known_by_Tabetha.html
        # Find the link at position 18 (the first name is 1).
        #   Follow that link. Repeat this process 7 times.
        #   The answer is the last name that you retrieve.

        # Expected: Name starts with 'L'

####################################################

# Import necessary libraries for Web Scraping
from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl
import re

# Create Variable
list = []                                                                       # List to store all lines read
i = 0                                                                           # iteration variable for count loop
name = None

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# Take in URL input
url = input('Enter - ')

# Take in position input
p = input('Enter Position: ')
p = int(p)
position = p - 1                                                                # Adjust for list offset

# Take in iteration input
c = input('Enter Count: ')
count = int(c)

while i < count:
    # Open URL and read into string delimited by '/n'
    html = urlopen(url, context=ctx).read()

    # BeautifulSoup parsing and correcting HTML for cleaner read
    soup = BeautifulSoup(html, "html.parser")

    # Retrieve all of the anchor tags
    tags = soup.find_all('a')

    # Add items into a list
    for tag in tags:
        list.append(tag)

    # Grab the line we need based on {position}
    line = list[position]

    # Grab URL from the line
    url = line.get('href')

    # Grab contents of the line (Name in this case)
    name = line.contents[0]

    # Clear List for next batch from new webpage
    list.clear()

    # Increment counter
    i = i + 1

# Print the  name
print(f"Last name in sequence: {name}")
