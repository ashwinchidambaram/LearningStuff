###### Data Preprocessing ########

# Importing the Dataset
dataset = read.csv('Data.csv')

# Taking Care of the Missing Data
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

# Encoding Categorical Data
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0, 1))


# Here we will be using the factor function, which will break down the categorical data into factors




# NOTE: using Function F1 will allow for lookup 