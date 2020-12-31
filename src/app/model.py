import psycopg2

class Model:

    def __init__ (self, DB_NAME, DB_USER, DB_HOST, DB_PASS):
        # Connection to database
        self.con = psycopg2.connect(
            dbname = DB_NAME,
            user = DB_USER,
            host = DB_HOST,
            password = DB_PASS
        )
    
    def listInstruments(self):
        # Cursor for database
        cur = self.con.cursor()

        # Query for instruments
        cur.execute("SELECT ri.name " +
            "FROM rental_instrument AS ri " +
            "NATURAL LEFT JOIN rental AS r " +
            "WHERE r.terminated IS NOT false;"
            )

        # Fetch result of query
        rows = cur.fetchall()
        
        # Temp print of instruments
        for r in rows:
            print(f"{r[0]}")

        # Close cursor
        cur.close()

    def rentInstrument(self):
        print("rented instrument")    
    
    def terminateRental(self):
        print("terminated rental")

    def close(self):
        # Close connection to database
        self.con.close()