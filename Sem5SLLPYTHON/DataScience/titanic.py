import pandas as pd

titanic_data=pd.read_csv('titanic.csv',sep='\t')

print(titanic_data.head())

new_data = titanic_data.drop(['Parch'],axis=1,inplace=False)

print(new_data.head())