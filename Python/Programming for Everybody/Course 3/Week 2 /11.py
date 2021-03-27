##### Extracting Data With Regular Expressions #####
####################################################
## Finding Numbers in a Haystack ##
###################################

# Problem: In this assignment you will read through and parse a file with text and numbers. You will extract all the numbers in the file and compute the sum of the numbers.
# Data Files Provided:
    # File 1 (Test - regex_sum_42.txt):
        # Expected: 90 values with a sum = 445833
    # File 2 (Real - regex_sum_1124098.txt):
        # Expected: 74 values and the sum ends with 405

####################################################

# Import RegEx Functions
import re

# Create a lsit in which to store the numbers that are identified
count = 0
numList = []
sum = 0

# Open file
file = open("regex_sum_1124098.txt")

# Parse through file to grab numbers and create a list
for line in file:
    line = line.rstrip()

    # Parse through line to grab any numbers
    val = re.findall('[0-9]+', line)

    # Check if the line contains numbers or is blank
    if len(val) != 0:

        # Add numbers to a new list, and also convert to an integer to be summed
        for item in val:

            # Add number to list
            numList.append(item)

            # Convert number (string) to number (int)
            value = int(item)

            # Add value into total sum
            sum = sum + value
            count = count + 1

    else:
        pass

print(f"Total Count: {count} Values")
print(f"Sum: {sum}")
