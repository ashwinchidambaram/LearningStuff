# Data Preprocessing Template

# Importing the libraries
import numpy as np
    ## numpy is used to perform any mathematical function in python and and create alias 'np' to make it easy to refer to
    
import matplotlib.pyplot as plt
    ## matplotlib.pyplot (matplotlib is main library, pyplot is sublibrary)
        
import pandas as pd
    ## pandas library is best to import and manage data sets
    
# Importing the Dataset
dataset = pd.read_csv('Data.csv')
    ## We set 'dataset' to the data that will be read from 'Data.csv'
    ## to do this, we use 'pd.read_csv()'
    
# NOTE: We need to distinguish the matrix of features, and the dependent variables vector 
    
# Creating Matrix of Features // Dependent Variable 
X = dataset.iloc[:, :-1].values 
    ## What we have in the bracket defines the data we will be extracting
    ## By using the first ':', we take all of the rows in the dataset
    ## By using the second ':-1', we are taking all of the columns except the last one (which is dependent in this case)
        
# Creating Dependent Variable Vector
Y = dataset.iloc[:, 3].values
    ## By using the first ':', we take all of the rows in the dataset
    ## By using the second '3', we are taking the third column (which is dependent in this case)

# Taking Care of Missing Data 
from sklearn.impute import SimpleImputer 
    ## sklearn AKA 'scikit learn' which has the ability to preprocess data
    ## Using SimpleImputer class which handles missing data
    
# NOTE: By highlighting a keyword and presssing 'Command I', we can inspect and understand syntax/usage 
imputer = SimpleImputer(missing_values = np.nan, strategy = 'mean')
    ## First we create the ruleset by which imputer will work 

imputer = imputer.fit(X[:, 1:3])
    ## Using imputer, we fit the X dataset in range [:, 1:3] and set it to the imputer object
        ### The ':' represents all lines/rows as before 
        ### The '1:3' represents the rows in which data is missing (1,2) but we use 3 as the end becuase the upper bound is always excluded

X[:, 1:3] = imputer.transform(X[:, 1:3])
    ## We are applying the method of the imputer object 'transform' that replaces the missing data with the mean of the column