extends Node


var Plot = [
]

var Harvests = [{
	"Name": "Tomato",
	"Count": 1,
	"Consumable": true,
}]

var Selected = 0

var Exp: int = 0


var Level = 1

func levelUp():
	if Game.Exp >= Game.Level:
		Game.Level += 1
		Game.Exp = 0
#var Health

#var UnlockArea


	
