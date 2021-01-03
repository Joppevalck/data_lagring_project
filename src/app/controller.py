import soundgoodHandler
import soundgoodModel

# Controlls the apps action between the database handler and model
class Controller:

    # On creation, inits the model and assign its db handler
    def __init__ (self, dbhandler):
        self.mdl = soundgoodModel.SoundgoodModel()
        self.dbh = dbhandler

    # Returns a list of a specefic instrument
    def list_instruments(self, instrument):
        try:
            return self.dbh.list_instruments(instrument)
        except Exception as e:
            raise Exception(e) 

    # Makes a rental to the given students id with the given rental instruments id
    def rent_instrument(self, student_id, rental_instrument_id):
        try:
            amount = self.dbh.amount_of_rentals(student_id)
            status = self.dbh.rental_instrument_status(rental_instrument_id)
            self.mdl.accept_rental(amount, status)
            self.dbh.rent_instrument(student_id, rental_instrument_id)
        except Exception as e:
            raise Exception(e)

    # Returns the students current rentals
    def terminate_options(self, student_id):
        return self.dbh.terminate_options(student_id)

    # Terminates a rental of the given rental instruments id
    def terminate_rental(self, rental_instrument_id):
        self.dbh.terminate_rental(rental_instrument_id)