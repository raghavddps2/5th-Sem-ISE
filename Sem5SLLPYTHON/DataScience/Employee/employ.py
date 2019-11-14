import pandas as pd

employee_data=pd.read_csv('employees.csv')
print(employee_data)

print(employee_data[0:5]['Salary'])
print(employee_data.loc[:,['Salary','Name']])
print(employee_data.loc[[1,3,5],['Salary','Name']])
print(employee_data.loc[2:6,['Salary','Name']])