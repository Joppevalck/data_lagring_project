import psycopg2
from datetime import datetime

# Handles fetching and updates to and from the database
class SoundgoodHandler:

    # On creation, connects to the database
    def __init__ (self, DB_NAME, DB_USER, DB_HOST, DB_PASS):
        try:
            # Connection to database
            self.con = psycopg2.connect(
                dbname = DB_NAME,
                user = DB_USER,
                host = DB_HOST,
                password = DB_PASS
            )

            # Cursor for database
            self.cur = self.con.cursor()
        except Exception as e:
            raise Exception("Could not connect to database")

    # Executes given script
    def execute_SQL(self, script):
        
        try:
            # Execute script
            self.cur.execute(script)
        except Exception as e:
            self.con.rollback()
            raise Exception(e)
        
        try:
            # Fetch result of query
            rows = self.cur.fetchall()
        except Exception:
            rows = ""

        try:
            # Commit changes to database
            self.con.commit()
        except Exception as e:
            raise Exception(e)

        return rows
    
    # Returns all of the rental instruments available for rent
    def list_instruments(self, instrument):
        query = """SELECT DISTINCT ri.rental_instrument_id, ri.fee_per_month, ri.brand 
        FROM rental_instrument AS ri 
        NATURAL LEFT JOIN (SELECT * FROM rental AS r WHERE r.terminated IS NOT true ORDER BY r.rental_date DESC) AS q
            WHERE q.terminated IS NOT false AND ri.name = \'%s\';"""%instrument.capitalize()

        return self.execute_SQL(query)

    # Returns how many non-terminated rentals the student has
    def amount_of_rentals(self, student_id):
        query = """SELECT COUNT(r.rental_id)
            FROM rental as r
            WHERE r.student_id = %s
            AND r.terminated = false;"""%student_id
        
        return self.execute_SQL(query)[0][0]

    # Returns status whether if the instrument is available for rent 
    def rental_instrument_status(self, rental_instrument_id):
        query = """SELECT COALESCE(q.terminated, true)
            FROM (
                SELECT ri.rental_instrument_id, r.terminated
                FROM rental_instrument AS ri 
                NATURAL LEFT OUTER JOIN rental AS r
                ORDER BY r.rental_date DESC
            ) AS q
            WHERE q.rental_instrument_id = %s
            LIMIT 1;"""%rental_instrument_id
        
        status = self.execute_SQL(query)

        if not status:
            return status
        return status[0][0]

    # Returns the given student id and its person id
    def get_student_person_id(self, student_id):
        query = """SELECT s.student_id, s.person_id
            FROM student AS s 
            WHERE s.student_id = %s"""%student_id

        return self.execute_SQL(query)
    
    # Returns the rental instrument id and its instrument id
    def get_instrument_id(self, rental_instrument_id):
        query = """SELECT ri.rental_instrument_id, ri.instrument_id 
        FROM rental_instrument AS ri 
        WHERE ri.rental_instrument_id = %s"""%rental_instrument_id

        return self.execute_SQL(query)

    # Adds one year to given current date
    def add_year(self):
        d = datetime.today()
        years = 1
        try:
            return d.replace(year = d.year + years)
        except ValueError:
            return d + (date(d.year + years, 1, 1) - date(d.year, 1, 1))

    # Rents a instrument
    def rent_instrument(self, student_id, rental_instrument_id):
        student = self.get_student_person_id(student_id)
        instrument = self.get_instrument_id(rental_instrument_id)
        date = datetime.today().strftime('%Y-%m-%d')

        script = f"""INSERT INTO rental 
            (rental_id, rental_date, return_date, rental_instrument_id, instrument_id, student_id, person_id, terminated)
            VALUES  (DEFAULT, '{date}', '{self.add_year().strftime('%Y-%m-%d')}', {instrument[0][0]}, {instrument[0][1]}, {student[0][0]}, {student[0][1]}, false);"""

        self.execute_SQL(script)

    # Returns a students rentals
    def terminate_options(self, student_id):
        query = """SELECT r.rental_id, ri.name, r.rental_date, r.return_date
            FROM rental AS r
            NATURAL LEFT OUTER JOIN rental_instrument AS ri
            WHERE r.student_id = %s 
            AND r.terminated = false;"""%student_id

        return self.execute_SQL(query)

    # Terminates a rental
    def terminate_rental(self, rental_instrument_id):
        date = datetime.today().strftime('%Y-%m-%d')

        script = f"""UPDATE rental 
        SET terminated = true, return_date = '{date}' 
        WHERE rental.rental_id = {rental_instrument_id};"""

        self.execute_SQL(script)

    # On deletion, closes connections to the database
    def __del__(self):
        # Close cursor
        self.cur.close()

        # Close connection to database
        self.con.close()

        
        