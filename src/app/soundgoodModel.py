# Model of the soundgood app
class SoundgoodModel:

    # Throws exception if the business model does not accept the rental
    def accept_rental(self, amount_of_rentals, rental_instrument_status):
        if amount_of_rentals is None:
            raise Exception("Student could not be found")
        if amount_of_rentals >= 2:
            raise Exception("Student has at least 2 rentals")
        if rental_instrument_status is None:
            raise Exception("Rental instrument could not be found")
        if rental_instrument_status == False:
            raise Exception("Rental instrument is already rented")

