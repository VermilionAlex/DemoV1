extends Node


var Plot = [
]

var Harvests = [{
	"Name": "Tomato",
	"Count": 0,
	"Consumable": true,
}
#,
#{
#	"Name": "Corn",
#	"Count": 0,
#	"Consumable": true,
#	}
]

var Selected = 0

var Exp: int = 0



var Level = 1

func levelUp():
	if Game.Exp >= Game.Level:
		Game.Level += 1
		Game.Exp = 0
		
		
var Gold: int = 0

var Unlocked = false
#var Health

#var UnlockArea

var Direction = Vector2.DOWN


var CheckDead = false
var RespawnPosition: Vector2
	
var CharPos: Vector2
