import soundgoodHandler
import soundgoodModel

class Controller:

    def __init__ (self, dbhandler):
        self.mdl = soundgoodModel.SoundgoodModel()
        self.dbh = dbhandler

    def listInstruments(self, instrument):
        try:
            return self.dbh.listInstruments(instrument)
        except Exception as e:
            raise Exception(e) 

    def rentInstrument(self, student_id, rental_instrument_id):
        try:
            amount = self.dbh.amountOfRentals(student_id)
            status = self.dbh.rentalInstrumentStatus(rental_instrument_id)
            self.mdl.acceptRental(amount, status)
            self.dbh.rentInstrument(student_id, rental_instrument_id)
        except Exception as e:
            raise Exception(e)

    def terminateRental(self):
        self.dbh.terminateRental()
    
    def close(self):
        self.dbh.close()
