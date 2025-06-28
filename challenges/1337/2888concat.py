import pandas as pd
# Write a solution to concatenate these two DataFrames vertically into one DataFrame.
def concatenateTables(df1: pd.DataFrame, df2: pd.DataFrame) -> pd.DataFrame:
    return pd.concat([df1, df2])