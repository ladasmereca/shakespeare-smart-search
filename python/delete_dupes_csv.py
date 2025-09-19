import pandas as pd

# Load your big CSV
df = pd.read_csv("shakespeare_with_titles.csv")

print("Original rows:", len(df))

# 1. Drop exact duplicates
df = df.drop_duplicates()
print("After dropping duplicates:", len(df))

# 2. Trim whitespace in string columns
str_cols = df.select_dtypes(include=["object"]).columns
for col in str_cols:
    df[col] = df[col].astype(str).str.strip()

# 3. Reset index
df = df.reset_index(drop=True)

# 4. Save cleaned file
df.to_csv("shakespeare_with_titles_clean.csv", index=False)

print("✅ Cleaned file saved as 'shakespeare_with_titles_clean.csv'")
