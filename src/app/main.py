import view
import controller
import soundgood_handler

# Sets the settings for the database and the couplings between layers
dbh = soundgood_handler.SoundgoodHandler("soundgood",
            "postgres",
            "db-soundgood",
            "password"
)
c = controller.Controller(dbh)
v = view.View(c)

# Main loop
answer = ""
while answer != "exit":
    answer = v.command()

