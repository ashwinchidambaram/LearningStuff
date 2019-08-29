###### Data Preprocessing Template ########

# Importing the libraries
import numpy as np    
import matplotlib.pyplot as plt        
import pandas as pd

# Importing the Dataset   
dataset = pd.read_csv('Data.csv')
    
# Creating Matrix of Features // Dependent Variable 
X = dataset.iloc[:, :-1].values 
        
# Creating Dependent Variable Vector
Y = dataset.iloc[:, 3].values

# Splitting a dataset into a Training Set and Test Set
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)

# Feature Scaling 
"""
from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
"""
    











