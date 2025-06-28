import pandas as pd


# Write a solution to display the first 3 rows of this DataFrame.
def selectFirstRows(employees: pd.DataFrame) -> pd.DataFrame:
    return employees.head(3)