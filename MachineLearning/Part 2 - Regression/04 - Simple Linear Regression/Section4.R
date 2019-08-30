###### Simple Linear Regression ########

## Importing the Dataset
dataset = read.csv('Salary_Data.csv')
# dataset = dataset[, 2:3]

## Splitting a dataset into a Training Set and Test Set
library(caTools)

# To split the dataset, we must first set it to the same seed
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)

# Create Training Set
training_set = subset(dataset, split == TRUE)

# Create Test Set
test_set = subset(dataset, split == FALSE)

## Feature Scaling 
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

## Fitting Simple Linear Regression to the Training Set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
  # "Salary ~ YearsExpereince"    ==>   Salary is proportional to YearsExperience 

## Predicting the Test Set Results
Y_pred = predict(regressor, newdata = test_set)

## Visualizing the Training Set Results 
library(ggplot2)
  # Automate selection of ggplot2 

# Plot for the Training Set
ggplot() +  
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary VS Exp (Test Set)') +
  xlab('Years of Exp') +
  ylab('Salary')

# Plot for the Test Set
ggplot() +  
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary VS Exp (Training Set)') +
  xlab('Years of Exp') +
  ylab('Salary')

#####################################################################################################################
# NOTE: using Function F1 will allow for lookup 
# NOTE: To install packages, simply use 'install.packages('PACKAGE_NAME')'
# NOTE: To run an instance of a package, use 'library(LIBRARY_NAME)
