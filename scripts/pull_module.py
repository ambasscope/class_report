import sqlite3
import pandas as pd
import sys

db_path = sys.argv[1]
excel_path = sys.argv[2]
sheet_name = sys.argv[3]

conn = sqlite3.connect(db_path)
df = pd.read_sql_query("SELECT * FROM module", conn)
conn.close()

with pd.ExcelWriter(excel_path, engine='openpyxl', mode='a', if_sheet_exists='replace') as writer:
    df.to_excel(writer, sheet_name=sheet_name, index=False)