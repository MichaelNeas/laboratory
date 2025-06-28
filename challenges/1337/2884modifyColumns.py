import pandas as pd

# Write a solution to modify the salary column by multiplying each salary by 2.

def modifySalaryColumn(employees: pd.DataFrame) -> pd.DataFrame:
    #employees["salary"] = employees["salary"] * 2
    employees.salary *= 2
    return employees