# Concepts.py 																		##
# Ashwin Chidambaram																##
# Purpose: This is a file that stores basic python code to look back to if need be	##
######################################################################################

######################################################################################
#### Basic Arithmetic ################################################################
######################################################################################
print('Basic Arithmetic:')		##
print('----------------- \n')	##
##################################

# Addition (+)
4 + 5

# Subtraction (-)
5 - 4		

# Multiplication (*)
4 * 5
# Division (/)
4 / 5
# Exponent/Power (**)
2 ** 4

# Modulus
9 % 2


##############
print('\n')	##
######################################################################################
#### Strings #########################################################################
######################################################################################
print('Strings: ')		##
print('-------- \n')	##
##########################

# To print a statement use print('')
print('Hello World!')

# To add a new line within a string use \n
print('This is a \nNew Line')

# To add a tab within a string use \t
print('This is a \tTab')

# NOTE: VARIABLE WILL BE USED FOR FOLLOWING 
text = 'This is demo text'
num = '123456789'
print('\n')

######## INDEX MANIPULATION ########

# To find the length of a string, use len()
print(len(text))

# To get a subsection of a string from position x to the end use: [x:]
print(text[4:])

# To get a subsection from the beginning up to position x (Does not include x): [:x]
print(text[:12])

# To get a whole string (Although it isn't likely to be used) use: [::]
print(num[::])

# To get a subsection of a string from position x to y (Does not include y) use: [x:y]
print(num[0:7])

# To get step sizes (z) of an index use: [::z] *This will essentially get values of 0 + z till the list ends*
print(num[::2])

# If we wanted to specify a start(x) and stop(y) with a step(z) use: [x:y:z]
print(num[2:6:1])

# To reverse a string, its quite easy to use reverse indexing which goes ... -3, -2, -1
print(num[::-1])

######## STRING MANIPULATION ########

# To make a string all uppercase, use .upper() method
print(text.upper())

# To make a string all lowercase, use .lower() method
print(text.lower())

# To split a string into a list, use .split() method (Generally will split based on whitespace)
print(text.split())

# A string can also be split into list based on a char instead of whitespace use .split('INSERT CHAR HERE')
print(text.split('s'))


##############
print('\n')	##
######################################################################################
#### Lists ###########################################################################
######################################################################################
print('Lists: ')	##
print('------ \n')	##
######################

# To create a list simply set a variable equal to the list enclosed in brackets.
nlist = [4, 2, 6, 1, 9]
llist = ['z', 'b', 'a', 'q', 'k', 'e']

# To get a value from a list of index x simply call list[x]
print(nlist[0])

# To concatenate two list of an index just add the two lists together such as lsit1 + list2
print(nlist + llist)

# To change a value within a list simply single the index out and then set it to a new value. Ex: list[0] = 3
nlist[0] = 8
print(nlist)

# To add an element to a list, use the .append() method
nlist.append(4)
print(nlist)

# To get the last element of a list use the .pop() method (this also removes the last value)
print(nlist.pop())
print(nlist)

# To get a specifc index from a list and remove it, you can specify it by doing .pop(INDEX)
print(llist) 			# Pre-pop
print(llist.pop(2))
print(llist) 			# Post-pop

# To sort a list, use the .sort() function
print(nlist)			# Pre-sort
nlist.sort()			# Sort
print(nlist)			# Post-sort

print(llist)			# Pre-sort
llist.sort()			# Sort
print(llist)			# Post-sort

# To reverse a list, use the .reverse() function
nlist.reverse()			# Reverse
print(nlist)			# Post-reverse

llist.reverse()			# Reverse
print(llist)			# Post-reverse


##############
print('\n')	##
######################################################################################
#### Dictionaries ####################################################################
######################################################################################
print('Dictionaries: ')		##
print('------------- \n')	##
##############################

# Generally a Dictionary will be used when the actual location of a value is not important, they are also super flexible with the values they can hold

# To create a key:value pair in a Dictionaries, simply denote {'key' : 'value'}
my_dict = {'key1' : 'value1' , 'key2' : 'value2'}
print(my_dict)

# To call a value associated with key 'x'
my_dict['key1']

# To add a key:value pair to a Dictionary, simply call the Dictionary with ['newKey'] = newValue
my_dict['key3'] = 'newValue'
print(my_dict)

# To overwrite a key's value do the same as above
my_dict['key3'] = 'value3'
print(my_dict)

# To get all the keys call .keys() on the Dictionary 
print(my_dict.keys())

# To get all the values call .values() on the Dictionary 
print(my_dict.values())

# To get all the key:value pairings call .items() on the Dictionary 
print(my_dict.items())


##############
print('\n')	##
######################################################################################
#### Tuples ##########################################################################
######################################################################################
print('Tuples: ')	##
print('------- \n')	##
######################

# Tuples are like lists but immutable

# Tuples are declared with () instead of []
t = (1,2,3,3,4,7,9)
print(t)

# To count how many times something occurs within a tuple, use .count('value to be counted')
t.count(3)

# To see the index of a value within a tuple, use .index('value to be found'). However, it will only return the first occurance of the value. So in the tuple above, 3 would be indexed at 2.
t.index(4)


##############
print('\n')	##
######################################################################################
#### Sets ############################################################################
######################################################################################
print('Sets: ')		##
print('----- \n')	##
######################

# Sets are unordered collections of unique items

# To create a set
myset = set()

# To add an element to the set, use .add('VALUE')
myset.add(1)
print(myset)

# It is also possible to get the set of a list; would be done to get the unique values of a set
testList = [1,1,1,2,3,4,2,1,3,4,5,6,7,9,7,5,4,3,4,6,7,8,0]
print(set(testList))


##############
print('\n')	##
######################################################################################
#### Booleans ########################################################################
######################################################################################
print('Booleans: ')		##
print('--------- \n')	##
##########################

# True/False or other comparisons
# True and False must be capitalized
# Some comparision operators are >, <, ==

# To create a none data type (so that it can be used later) use None as an assignment 
b = None


##############
print('\n')	##
######################################################################################
#### File I/O ########################################################################
######################################################################################
print('File I/O: ')		##
print('--------- \n')	##
##########################


# To open a tet file, use open('FILENAME')
testfile = open('myfile.txt')

# To read the contents of a text file, use .read()
testfile.read()

# After reading a file, you can not reread the file w/out moving back to the start of the file. To do so, use .seek(0)
testfile.seek(0)

# To print each line by itself, use .readlines()
print(testfile.readlines())

# ALWAYS close a file when its not being used. To do so, use .close()
testfile.close()

# Another way to use a file without having to worry about closing it is by doing the following 
with open('myfile.txt') as my_new_file:
	contents = my_new_file.read()

# To specify whether a program can do to a file, add mode = 'MODE' to the inside of the open. Ex: open('myfile.txt', mode = 'r')
# The different modes are: 
# r - read only
# w - write only
# a - append (add to file)
# r+ - reading and writing
# w+ - writing and reading (Overwrite existing file or write new one)
















