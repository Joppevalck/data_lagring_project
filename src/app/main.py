import view
import controller
import model

m = model.Model(
    "soundgood",
    "postgres",
    "db-soundgood",
    "password"
)
c = controller.Controller(m)
v = view.View(c)

answer = ""
while answer != "exit":
    v.menu()
    answer = v.select()
    