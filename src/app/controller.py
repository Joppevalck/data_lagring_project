import model

class Controller:

    def __init__ (self, model):
        self.mdl = model

    def listInstruments(self):
        self.mdl.listInstruments()
    
    def rentInstrument(self):
        self.mdl.rentInstrument()
    
    def terminateRental(self):
        self.mdl.terminateRental()
    
    def close(self):
        self.mdl.close()
