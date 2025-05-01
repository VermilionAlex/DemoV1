extends Area2D


#Referencing tutorial/template from CodingQuests on YouTube


#Animation variables
var Ctime = 0.0
var speed = 2.0  
var original_color = Color(1, 1, 1, 1)  
var target_color = Color(1.5, 1.5, 1.5, 1)  
var amplitude := 2 
var base_y := 0.0   


#Animation for spinning
var flip_speed = 2.0 
var Ftime = 0.0


#Plant stages
var stage = 1
var PlantNum = -1
onready var timer = $Timer
var time = 0.0
onready var plant = $Sprite







func _ready():
	if time != 0:
		timer.wait_time = time
	if PlantNum == -1:
		PlantNum = Game.Plot.size()
	Game.Plot += [{
		"Seed": "Corn",
		"TimeLeft": timer.time_left,
		"Stage": stage,
		"Harvested": false,
		"Index" : 0,
	}]
	

func _process(delta):
	Game.Plot[PlantNum]["TimeLeft"] = timer.time_left
	match stage:
		1, 2, 3, 4, 5:
			plant.frame = stage
		6:
			plant.frame = 5
			time += delta * speed
			var t = (sin(time) + 1.0) / 2.0  # Smooth oscillation between 0 and 1
			$Sprite.modulate = original_color.linear_interpolate(target_color, t)
			position.y = base_y + sin(time) * amplitude
			
			#Flip animation
			Ftime += delta * flip_speed
			var scale_x = cos(time)
			$Sprite.scale.x = scale_x


func _on_Timer_timeout():
	if stage <= 5:
		stage += 1
	Game.Plot[PlantNum]["Stage"] = stage
	Utils.save_game()


func freeNull():
	Ctime = null
	speed= null
	flip_speed = null
	Ftime = null
	

func _on_Corn_body_entered(body):
	var has_item = false
	if stage >= 5:
		if body.name == "Player":
			for i in Game.Harvests.size():
				if "Corn" in Game.Harvests[i]["Name"]:
					has_item = true
				
			if has_item:
				for i in Game.Harvests.size():
					if "Corn" == Game.Harvests[i]["Name"]:
						Game.Harvests[i]["Count"] += 1
			else:
				Game.Harvests += [{
					"Name": "Corn",
					"Count": 1,
					"Consumable": true,
				}]
				
			Game.Plot[PlantNum]["Harvested"] = true
			#Game.Plot.pop_at(PlantNum)
			#Game.Plot.sort()
			Game.Exp += 1
			Game.levelUp()
			print("Cur Exp:" +str(Game.Exp))
			print("Level is:" + str(Game.Level))
			get_parent().has_seed = false
			freeNull()
			
			queue_free()
			
			Utils.save_game()
		
