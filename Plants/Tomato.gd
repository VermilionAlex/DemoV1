extends Area2D

#Code tutorial/template from CodingQuests on YouTube


onready var timer = $Timer
var time = 0.0
onready var plant = $Sprite
var stage = 1
var PlantNum = -1

var done = false
func _ready():
	if time != 0:
		timer.wait_time = time
	if PlantNum == -1:
		PlantNum = Game.Plot.size()
	Game.Plot += [{
		"Seed": "Tomato",
		"TimeLeft": timer.time_left,
		"Stage": stage,
		"Harvested": false,
	}]
	

func _process(delta):
	Game.Plot[PlantNum]["TimeLeft"] = timer.time_left
	match stage:
		1:
			plant.frame = stage + 6
		2:
			plant.frame = stage + 6
		3:
			plant.frame = stage + 6
		4:
			plant.frame = stage + 6
		5:
			plant.frame = stage + 6
		6:
			plant.frame = 11
	
			$Label.visible = true

func _on_Timer_timeout():
	if stage <= 5:
		stage += 1
	Game.Plot[PlantNum]["Stage"] = stage




#Harvest function
func _on_Tomato_body_entered(body):
	var has_item = false
	if stage >= 5:
		if body.name == "Player":
			for i in Game.Harvests.size():
				if "Tomato" in Game.Harvests[i]["Name"]:
					has_item = true
				
			if has_item:
				for i in Game.Harvests.size():
					if "Tomato" == Game.Harvests[i]["Name"]:
						Game.Harvests[i]["Count"] += 1
			else:
				Game.Harvests += [{
					"Name": "Tomato",
					"Count": 1,
					"Consumable": true,
				}]
			Game.Plot[PlantNum]["Harvested"] = true
			$Label.visible= false
			Game.Exp += 1
			Game.levelUp()
			print("Cur Exp:" +str(Game.Exp))
			print("Level is:" + str(Game.Level))
			get_parent().has_seed = false
			queue_free()




