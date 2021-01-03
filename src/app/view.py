import controller

class View:

    # Constructor, sets controller
    def __init__(self, controller):
        self.ctrl = controller

    # Prints a menu for command line interface 
    def help(self):
        print("\tlist [instrument type] \t\t\t\tList Rental Instruments, needs second argument to specify which instrument type")
        print("\trent [student id] [rental instrument id] \tRent Instrument")
        print("\tterminate \t\t\t\t\tTerminate Rental")
        print("\thelp \t\t\t\t\t\tInformation of commands")
        print("\tq \t\t\t\t\t\tExit program")
        
    def listInstruments(self, args):
        if len(args) < 2:
            raise AttributeError("Need to write which instrument")

        # Fetch the rental instruments available
        rows = self.ctrl.listInstruments(args[1])
        
        # Temp print of instruments
        if rows:
            print("")
            for r in rows:
                print(f"ID: {r[0]}, Fee Per Month: {r[1]}, Brand: {r[2]}")
            print("")
        else:
            print("No rental instruments by that type")

    def rentInstument(self, args):
        if len(args) < 3:
            raise AttributeError("Need to write which student and instrument")

        rows = self.ctrl.rentInstrument(args[1], args[2])
    # Lets user to input to select by options
    def command(self):
        user_input = input("> ")
        args = user_input.split()

        try:
            if args[0] == "q":
                print("Exiting...")
                return "exit"

            elif args[0] == "help":
                self.help()

            elif args[0] == "list":
                self.listInstruments(args)

            elif args[0] == "rent":
                self.rentInstument(args)
                print("Rent successful")
            elif args[0] == "terminate":
                self.ctrl.terminateRental()
            else:
                print("Error: Invalid command, type help for information")
        except Exception as e: 
            print(e)
        return ""


        
        
        
        
        

    