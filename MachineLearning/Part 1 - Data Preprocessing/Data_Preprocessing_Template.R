###### Data Preprocessing Template ########

## Importing the Dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]

## Splitting a dataset into a Training Set and Test Set
library(caTools)

# To split the dataset, we must first set it to the same seed
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)

# Create Training Set
training_set = subset(dataset, split == TRUE)

# Create Test Set
test_set = subset(dataset, split == FALSE)

## Feature Scaling 
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

#####################################################################################################################
# NOTE: using Function F1 will allow for lookup 
# NOTE: To install packages, simply use 'install.packages('PACKAGE_NAME')'
# NOTE: To run an instance of a package, use 'library(LIBRARY_NAME)
