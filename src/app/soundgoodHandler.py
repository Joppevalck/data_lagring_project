import psycopg2
from datetime import datetime

class SoundgoodHandler:


    def __init__ (self, DB_NAME, DB_USER, DB_HOST, DB_PASS):
        # Connection to database
        self.con = psycopg2.connect(
            dbname = DB_NAME,
            user = DB_USER,
            host = DB_HOST,
            password = DB_PASS
        )

    # Executes given script
    def executeSQL(self, script):
        try:
            # Cursor for database
            cur = self.con.cursor()
        except Exception as e:
            raise Exception("Could not connect to database")
        
        try:
            # Execute script
            cur.execute(script)
        except Exception as e:
            raise Exception(e)
        
        try:
            # Fetch result of query
            rows = cur.fetchall()
        except Exception:
            rows = ""
        # Close cursor
        cur.close()

        return rows
    
    # Returns all of the rental instruments available for rent
    def listInstruments(self, instrument):
        query = """SELECT ri.rental_instrument_id, ri.fee_per_month, ri.brand 
            FROM rental_instrument AS ri 
            NATURAL LEFT JOIN rental AS r 
            WHERE r.terminated IS NOT false 
            AND ri.name = \'%s\';"""%instrument.capitalize()

        return self.executeSQL(query)

    # Returns how many non-terminated rentals the student has
    def amountOfRentals(self, student_id):
        query = """SELECT COUNT(r.rental_id)
            FROM rental as r
            WHERE r.student_id = %s
            AND r.terminated = false;"""%student_id
        
        return self.executeSQL(query)[0][0]

    # Returns status whether if the instrument is available for rent 
    def rentalInstrumentStatus(self, rental_instrument_id):
        query = """SELECT COALESCE(q.terminated, true)
            FROM (
                SELECT ri.rental_instrument_id, r.terminated
                FROM rental_instrument AS ri 
                NATURAL LEFT OUTER JOIN rental AS r
                ORDER BY r.rental_date DESC
            ) AS q
            WHERE q.rental_instrument_id = %s
            LIMIT 1;"""%rental_instrument_id
        
        status = self.executeSQL(query)

        if not status:
            return status
        return status[0][0]

    def getStudentPersonId(self, student_id):
        query = """SELECT s.student_id, s.person_id
            FROM student AS s 
            WHERE s.student_id = %s"""%student_id

        return self.executeSQL(query)
    
    def getInstrumentId(self, rental_instrument_id):
        query = """SELECT ri.rental_instrument_id, ri.instrument_id 
        FROM rental_instrument AS ri 
        WHERE ri.rental_instrument_id = %s"""%rental_instrument_id

        return self.executeSQL(query)

    # Adds one year to given current date
    def add_year(self):
        d = datetime.today()
        years = 1
        try:
            return d.replace(year = d.year + years)
        except ValueError:
            return d + (date(d.year + years, 1, 1) - date(d.year, 1, 1))

    def rentInstrument(self, student_id, rental_instrument_id):
        student = self.getStudentPersonId(student_id)
        instrument = self.getInstrumentId(rental_instrument_id)
        date = datetime.today().strftime('%Y-%m-%d')

        sqript = f"""INSERT INTO rental 
            (rental_id, rental_date, return_date, rental_instrument_id, instrument_id, student_id, person_id, terminated)
            VALUES  (DEFAULT, '{date}', '{self.add_year().strftime('%Y-%m-%d')}', {instrument[0][0]}, {instrument[0][1]}, {student[0][0]}, {student[0][1]}, false);"""

        self.executeSQL(sqript)

    def terminateRental(self):
        print("terminated rental")

    def close(self):
        # Close connection to database
        self.con.close()