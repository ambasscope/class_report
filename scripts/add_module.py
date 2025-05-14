import sqlite3
import sys

db_path, module_name, module_code = sys.argv[1:4]

conn = sqlite3.connect(db_path)
cursor = conn.cursor()
cursor.execute("""
    INSERT INTO modules(module_name, module_code)
    VALUES (?, ?)
""", (module_name, module_code))
conn.commit()
conn.close()