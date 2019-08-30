###### Simple Linear Regression ########

# Importing the libraries
import numpy as np    
import matplotlib.pyplot as plt        
import pandas as pd

# Importing the Dataset   
dataset = pd.read_csv('Salary_Data.csv')
    
# Creating Matrix of Features // Dependent Variable 
X = dataset.iloc[:, :-1].values 
        
# Creating Dependent Variable Vector
Y = dataset.iloc[:, 1].values

# Splitting a dataset into a Training Set and Test Set
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 1/3, random_state = 0)

# Feature Scaling 
"""
from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
"""

# Fitting Simple Linear Regression to the Training Set
from sklearn.linear_model import LinearRegression
    # Using linear_model library for simple linear regression
        # Will also import the linear regression class
        # Then create an object using the linear regression class that will act as the regressor
            # To create this object, we need tp use the 'fit' method which is part of the prior class
            
regressor = LinearRegression()
regressor.fit(X_train, Y_train)

# Predicting the Test Set Results 
Y_pred = regressor.predict(X_test)
    # Y_pred is a vector that will hold all predicted values 
        # To do so, we will use a method called 'predict' from the Linear Regression class

# Visualizing the Training Set Results 
    # We need to plot our observation points and how linear regression line 
plt.scatter(X_train, Y_train, color = 'red')
    # To plot the real observation points we need to use plt.scatter 
        # plt.scatter will make a scatter plot of our observations 

plt.plot(X_train, regressor.predict(X_train), color = 'blue')
    # To create a line from our data
    
plt.title('Salary VS Exp (Training Set)')
    # Add a title

plt.xlabel('Years of Experience')
    # Create a label for the x axis
    
plt.ylabel('Salary')
    # Create a label for the y axis

plt.show()
    # To indicate it is the end of our graph and we are ready to plot it
    
# Visualizing the Test Set Results 
plt.scatter(X_test, Y_test, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue')
plt.title('Salary VS Exp (Test Set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()