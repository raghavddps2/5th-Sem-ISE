# make sure csv file is in working directory

import pandas as pd
from pandas import Series,DataFrame

iris_df = pd.read_csv("iris.csv")
print ("Printing...... \n")
print(iris_df.head())
print("-----------------------------------")
iris_df.info()
print("-----------------------------------")
print(iris_df.describe())
print("-----------------------------------")
print(iris_df[["variety","sepal.length"]].groupby(['variety'],as_index=False).mean())
