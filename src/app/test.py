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

cur.execute("SELECT ri.name " +
    "FROM rental_instrument AS ri " +
    "NATURAL LEFT JOIN rental AS r " +
    "WHERE r.terminated IS NOT false;"
    )

rows = cur.fetchall()

for r in rows:
    print(f"{r[0]}")

cur.close()

# Close the connection
con.close()