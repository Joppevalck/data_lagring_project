import psycopg2

class Model:

    def __init__ (self, DB_NAME, DB_USER, DB_HOST, DB_PASS):
        self.con = psycopg2.connect(
            dbname = DB_NAME,
            user = DB_USER,
            host = DB_HOST,
            password = DB_PASS
        )
    
    def listInstruments(self):
        print("instruments")
    
    def rentInstrument(self):
        print("rented instrument")    
    
    def terminateRental(self):
        print("terminated rental")