extends YSort


const Corn = preload("res://Plants/Corn.tscn")
const Ttoe = preload("res://Plants/Tomato.tscn")




func _ready():
	var landPlot = Game.Plot.duplicate()  
	print(Game.Harvests)
	print(landPlot)
	print(landPlot.size())

	if landPlot.size() > 0:
		for i in range(landPlot.size() - 1, -1, -1):  
			var plot_data = landPlot[i]
			var plant1
			match plot_data["Seed"]:
				"Corn":
					plant1 = Corn.instance()
				"Tomato":
					plant1 = Ttoe.instance()
				_:
					continue

			plant1.PlantNum = i
			plant1.stage = int(plot_data["Stage"])
			plant1.time = float(round(plot_data["TimeLeft"]))

			var dirt_name = "Dirt" + str(i)
			if has_node(dirt_name):
				var dirt = get_node(dirt_name)
				dirt.add_child(plant1)
				dirt.has_seed = true

			Game.Plot.pop_at(i)
	Utils.save_game()  # move outside loop for efficiency

