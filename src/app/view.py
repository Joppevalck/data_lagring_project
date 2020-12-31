import controller

class View:

    # Constructor, sets controller
    def __init__(self, controller):
        self.ctrl = controller

    # Prints a menu for command line interface 
    def menu(self):
        print("Menu")
        print("1. \tList Instruments")
        print("2. \tRent Instrument")
        print("3. \tTerminate Rental")
        

    # Lets user to input to select by options
    def select(self):
        direction = input("Choose one, to exit write q\n")

        if direction == "q":
            return "exit"
        
        if direction == "1":
            ctrl.listInstruments()
        elif direction == "2":
            ctrl.rentInstrument()
        elif direction == "3":
            ctrl.terminateRental()

        return "selected"


        
        
        
        
        

    