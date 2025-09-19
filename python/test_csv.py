import pandas as pd

df = pd.read_csv("shakespeare_with_titles.csv")

# 1. How many rows?
print("Rows:", len(df))

# 2. How many unique titles (plays/sonnets/etc)?
print("Unique titles:", df["Title"].nunique())
print("Some titles:", df["Title"].unique()[:10])

# 3. Any missing titles?
print("Missing titles:", df["Title"].isna().sum())

# 4. Columns present
print("Columns:", df.columns.tolist())

# 5. Quick preview
print(df.head(10))

# 6. Optional: check duplicates
print("Duplicate rows:", df.duplicated().sum())

# 7. Optional: check for nulls
print("Nulls:", df.isna().sum())
