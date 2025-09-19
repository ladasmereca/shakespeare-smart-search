import pandas as pd

# Load your combined file
df = pd.read_csv("shakespeare_with_titles.csv")

# Find duplicate rows
dupes = df[df.duplicated(keep=False)]

# How many duplicates?
print("Duplicate rows:", len(dupes))

# Show a sample to inspect
print(dupes.head(20))

