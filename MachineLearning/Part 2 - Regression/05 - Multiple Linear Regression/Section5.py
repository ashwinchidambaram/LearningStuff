###### Simple Linear Regression ########

# Importing the libraries
import numpy as np    
import matplotlib.pyplot as plt        
import pandas as pd

# Importing the Dataset   
dataset = pd.read_csv('50_Startups.csv')
    
# Creating Matrix of Features // Dependent Variable 
X = dataset.iloc[:, :-1].values 
        
# Creating Dependent Variable Vector
Y = dataset.iloc[:, 4].values

# Encoding categorical data 
from sklearn.preprocessing import LabelEncoder, OneHotEncoder 
labelencoder_X = LabelEncoder()
X[:, 3] = labelencoder_X.fit_transform(X[:, 3])
onehotencoder = OneHotEncoder(categorical_features = [3])
X = onehotencoder.fit_transform(X).toarray()

# Avoiding the Dummy Variable Trap 
X = X[:, 1:]
    # This isn't always required, becuase Python should automatically do this 

# Splitting a dataset into a Training Set and Test Set
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 1/5, random_state = 0)

# Feature Scaling 
"""
from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
"""
    
# Fitting Multiple Linear Regression to the Training Set
from sklearn.linear_model import LinearRegression

regressor = LinearRegression()
regressor.fit(X_train, Y_train)

# Predicting the Test Set Results 
Y_pred = regressor.predict(X_test) 





