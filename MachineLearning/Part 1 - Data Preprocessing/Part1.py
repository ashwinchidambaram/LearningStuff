##### Data Preprocessing Template ######

# Importing the libraries

import numpy as np
    ## numpy is used to perform any mathematical function in python and and create alias 'np' to make it easy to refer to
    
import matplotlib.pyplot as plt
    ## matplotlib.pyplot (matplotlib is main library, pyplot is sublibrary)
        
import pandas as pd
    ## pandas library is best to import and manage data sets

# --------------------------------
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

# --------------------------------
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
    
# --------------------------------
# Encoding categorical data 
    
# from sklearn.preprocessing import LabelEncoder 
# labelencoder_X = LabelEncoder()
# X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
    ## Doing the above, results in a bias due to how a computer works and assigns the countries differing values
    
    ## To prevent this, we can can create a series of dummy variables that will be set as one column for each categorical variable
    ## In this example, we have {France, Germany, and Spain} so will create three dummy columns
        ## To image a visual, think about creating a truth table with {x, y, z} where we use 1 for an instance an 0 if not
    
from sklearn.preprocessing import LabelEncoder, OneHotEncoder 
labelencoder_X = LabelEncoder()
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
onehotencoder = OneHotEncoder(categorical_features = [0])
X = onehotencoder.fit_transform(X).toarray()

labelencoder_Y = LabelEncoder()
Y = labelencoder_Y.fit_transform(Y)

# --------------------------------
# Splitting a dataset into a Training Set and Test Set

from sklearn.model_selection import train_test_split
    ## Import train_test_split library from model_selection library (previously cross_validation) 

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)
    ## Create training and testing variables
    ## By using 'test_size', we specify the quantity of dataset split in decimal [0.5 => 50% split]

# --------------------------------
# Feature Scaling 

from sklearn.preprocessing import StandardScaler 
    ## Import StandardScaler from Impute 
    
sc_X = StandardScaler()
    # To scale the independent set
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
    ## Need to fit the training set, and transofrm the test set
    ## Don't need to fit the test set, because we already did that to the training set

# NOTE: Don't need to apply feature scaling for Y set because here they are only 1 or 0, but likely to use for other situations
    











