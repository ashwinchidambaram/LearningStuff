##### Scraping HTML Data with BeautifulSoup #####
####################################################
## Scraping Numbers from HTML using BeautifulSoup ##
####################################################

# Problem: In this assignment you will write a Python program similar to http://www.py4e.com/code3/urllink2.py. The program will use urllib to read the HTML from the data files below, and parse the data, extracting numbers and compute the sum of the numbers in the file.
# Data Files Provided:
    # File 1 (Test) - http://py4e-data.dr-chuck.net/comments_42.html
        # Expected: Sum = 2553
    # File 2 (Real) - http://py4e-data.dr-chuck.net/comments_1124100.html
        # Expected: Sum ends with 10

####################################################

# Import necessary libraries for Web Scraping
from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl
import re

# Create sum variable
sum = 0

# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# Take in URL input
url = input('Enter - ')

# Open URL and read into string delimited by '/n'
html = urlopen(url, context=ctx).read()

# BeautifulSoup parsing and correcting HTML for cleaner read
soup = BeautifulSoup(html, "html.parser")

# Retrieve all of the anchor tags
tags = soup.find_all('span')
for tag in tags:

    # Get the numeric values in the line
    value = int(tag.contents[0])

    # Add value into sum variable
    sum = sum + value

# Output sum
print(f"Sum: {sum}")
