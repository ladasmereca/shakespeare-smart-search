import pandas as pd
import glob
import os

# read all csvs in the folder
files = glob.glob("C:/VSCode_Projects/VSCode_Code/Shakespear_Smart_Search/data/*.csv")
dfs = []

for f in files:
    title = os.path.splitext(os.path.basename(f))[0]  # filename without .csv
    df = pd.read_csv(f)
    df["Title"] = title  # attach play name
    dfs.append(df)

big_df = pd.concat(dfs, ignore_index=True)
big_df.to_csv("shakespeare_with_titles.csv", index=False)



