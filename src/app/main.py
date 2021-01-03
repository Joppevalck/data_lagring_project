import view
import controller
import soundgoodHandler

dbh = soundgoodHandler.SoundgoodHandler("soundgood",
            "postgres",
            "db-soundgood",
            "password"
)
c = controller.Controller(dbh)
v = view.View(c)

answer = ""
while answer != "exit":
    answer = v.command()
