import sqlite3
import sys

db_path, class_name, date, topic = sys.argv[1:5]

conn = sqlite3.connect(db_path)
cursor = conn.cursor()
cursor.execute("""
    INSERT INTO ClassSessions (class_name, date, topic)
    VALUES (?, ?, ?)
""", (class_name, date, topic))
conn.commit()
conn.close()