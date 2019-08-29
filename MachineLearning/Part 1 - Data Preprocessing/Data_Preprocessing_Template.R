###### Data Preprocessing ########

## Importing the Dataset
dataset = read.csv('Data.csv')

## Taking Care of the Missing Data
dataset$Age = ifelse(is.na(dataset$Age), 
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), 
                     dataset$Age) 
  # Code Breakdown: 
    # What it's doing: Replacing the missing value in the column age by the mean of the column age itself
    # By using '$' after the dataset name, we can select the column of interest 
    # dataset$Age                                                     => Modifying 'Age' column of dataset 
    # ifelse                                                          => Syntax: (test, condition TRUE , condition FALSE)
    # is.na(dataset$Age)                                              => If there exists NaN field in 'Age' column of dataset 
    # ave(dataset$Age, FUN = function(x) mean (x, na.rm = TRUE))      => Compute average of which column of dataset, add function 
    # dataset$Age)                                                    => If value in column is not missing, return original 

dataset$Salary = ifelse(is.na(dataset$Salary), 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), 
                     dataset$Salary) 

## Encoding Categorical Data
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
  # Here we will be using the factor function, which will break down the categorical data into factors

dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0, 1))

## Splitting a dataset into a Training Set and Test Set

  #install.packages('caTools')
    # To install packages, simply use 'install.packages('PACKAGE_NAME')'
  library(caTools)
    # Runs an insta  ce to activate a package 

  # To split the dataset, we must first set it to the same seed
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
  # In python we usually specify the split in terms of a test set
  # In R we specify in terms of a training set

# Create Training Set
training_set = subset(dataset, split == TRUE)

# Create Test Set
test_set = subset(dataset, split == FALSE)

## Feature Scaling 

#training_set = scale(training_set)
#test_set = scale(test_set)
  # To scale the training and test set, it can be done as simply as above

# However, since we have two non-numeric columns [1, 4] we can't use above method. Instead: 
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])





#####################################################################################################################
# NOTE: using Function F1 will allow for lookup 
# NOTE: To install packages, simply use 'install.packages('PACKAGE_NAME')'
# NOTE: To run an instance of a package, use 'library(LIBRARY_NAME)
