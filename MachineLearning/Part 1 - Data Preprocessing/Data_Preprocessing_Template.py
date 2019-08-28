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