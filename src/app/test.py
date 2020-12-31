DB_HOST = "db-soundgood"
DB_NAME = "soundgood"
DB_USER = "postgres"
DB_PASS = "password"

import psycopg2

# Connect to DB
con = psycopg2.connect(
    dbname = DB_NAME,
    user = DB_USER,
    host = DB_HOST,
    password = DB_PASS
)

# Cursor
cur = con.cursor()

cur.execute("SELECT * FROM ensamblesheldnextweek;")

rows = cur.fetchall()

for r in rows:
    print(f"Weekday: {r[0]} \t| Genre: {r[1]} \t| Seats: {r[2]}")

cur.close()

# Close the connection
con.close()