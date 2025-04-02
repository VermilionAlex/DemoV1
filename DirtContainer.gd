extends YSort


const Corn = preload("res://Plants/Corn.tscn")
const Tomatoe = preload("res://Plants/Tomato.tscn")




#Code tutorial/template from CodingQuests on YouTube


func _ready():
	var landPlot = Game.Plot
	print(Game.Harvests)
	print(landPlot)
	print(landPlot.size())
	if landPlot.size() > 0:
		for i in landPlot.size():
			match (landPlot[i-1]["Seed"]):
				"Corn":
					Game.Plot.pop_at(i)
					var plant1 = Corn.instance()
					plant1.PlantNum = i
					plant1.stage = int(landPlot[i-1]["Stage"])
					plant1.time = (float(round(landPlot[i-1]["TimeLeft"])))
					var dirt_name = "Dirt" + str(i)
					if has_node(dirt_name):
						get_child(i).add_child(plant1)
						get_child(i).has_seed = true
						Utils.save_game()
						
				"Tomato":
					Game.Plot.pop_at(i)
					var plant1 = Tomatoe.instance()
					plant1.PlantNum = i
					plant1.stage = int(landPlot[i-1]["Stage"])
					plant1.time = (float(round(landPlot[i-1]["TimeLeft"])))
					var dirt_name = "Dirt" + str(i)
					if has_node(dirt_name):
						get_child(i).add_child(plant1)
						get_child(i).has_seed = true
						Utils.save_game()
