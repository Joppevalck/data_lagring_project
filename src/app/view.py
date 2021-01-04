import controller

# View of the soundgood application
class View:

    # On creation, sets controller
    def __init__(self, controller):
        self.ctrl = controller

    # Prints a menu for command line interface 
    def help(self):
        print("\tlist [instrument type] \t\t\t\tList Rental Instruments, needs second argument to specify which instrument type")
        print("\trent [student id] [rental instrument id] \tRent Instrument")
        print("\tterminate [student id] \t\t\t\tTerminate Rental")
        print("\thelp \t\t\t\t\t\tInformation of commands")
        print("\tq \t\t\t\t\t\tExit program")
    
    # Requests listing instruments
    def list_instruments(self, args):
        if len(args) < 2:
            raise AttributeError("Need to write which instrument")

        # Fetch the rental instruments available
        rows = self.ctrl.list_instruments(args[1])
        
        # Temp print of instruments
        if rows:
            print("")
            for r in rows:
                print(f"ID: {r[0]}, Fee Per Month: {r[1]}, Brand: {r[2]}")
            print("")
        else:
            print("No rental instruments by that type")

    # Requests a rental
    def rent_instument(self, args):
        if len(args) < 3:
            raise AttributeError("Need to write which student and instrument")
        if int(args[1]) < 0 or int(args[2]) < 0:
            raise AttributeError("Cannot have negative arguments")
        self.ctrl.rent_instrument(args[1], args[2])
        print("Rent successful")
    
    # Requests a termination
    def terminate_rental(self, args):
        if len(args) < 2:
            raise AttributeError("Need to write which student")

        options = self.ctrl.terminate_options(args[1])

        if options:
            print("")
            for r in options:
                print(f"ID: {r[0]}, Instrument: {r[1]}, Rental date: {r[2]}, Last return date: {r[3]}")
            print("")
        else:
            print("Either there is no rentals of that student or invalid student id")
            return

        done = False
        while not done:
            try:
                instrument_id =  int(input("\tWhich rental should be terminated? (Type the ID): ").strip())
                done = True
            except Exception:
                print("Invalid input, try again")

                
        for r in options:
            if r[0] == instrument_id:
                self.ctrl.terminate_rental(instrument_id)
                print("Termination successful")
                return
        print("No rental was terminated, no matching id, try again")

    # Lets user to input to select by options
    def command(self):
        user_input = input("> ")
        args = user_input.split()

        if not args:
            return ""
        try:
            if args[0] == "q":
                print("Exiting...")
                return "exit"

            elif args[0] == "help":
                self.help()

            elif args[0] == "list":
                self.list_instruments(args)

            elif args[0] == "rent":
                self.rent_instument(args)

            elif args[0] == "terminate":
                self.terminate_rental(args)

            else:
                print("Error: Invalid command, type help for information")
        
        except Exception as e: 
            print(e)
        return ""


        
        
        
        
        

    