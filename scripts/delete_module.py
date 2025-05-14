import sqlite3
import sys

db_path, module_id = sys.argv[1:3]

conn = sqlite3.connect(db_path)
cursor = conn.cursor()
cursor.execute("DELETE FROM modules WHERE id = ?", (module_id,))
conn.commit()
conn.close()