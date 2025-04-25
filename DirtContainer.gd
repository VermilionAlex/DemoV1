extends YSort


const Corn = preload("res://Plants/Corn.tscn")
const Tomatoe = preload("res://Plants/Tomato.tscn")




#Code tutorial/template from CodingQuests on YouTube


func _ready():
	var landPlot = Game.Plot.duplicate()  # critical fix
	print(Game.Harvests)
	print(landPlot)
	print(landPlot.size())

	if landPlot.size() > 0:
		for i in range(landPlot.size() - 1, -1, -1):  # loop backwards
			var plot_data = landPlot[i]
			var plant1
			match plot_data["Seed"]:
				"Corn":
					plant1 = Corn.instance()
				"Tomato":
					plant1 = Tomatoe.instance()
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
#	var landPlot = Game.Plot
#	print(Game.Harvests)
#	print(landPlot)
#	print(landPlot.size())
#
#	if landPlot.size() > 0:
#		for i in range(landPlot.size() - 1, -1, -1):  # loop backwards
#			var plot_data = landPlot[i]
#			var plant1
#			match plot_data["Seed"]:
#				"Corn":
#					plant1 = Corn.instance()
#				"Tomato":
#					plant1 = Tomatoe.instance()
#				_:
#					continue
#
#			plant1.PlantNum = i
#			plant1.stage = int(plot_data["Stage"])
#			plant1.time = float(round(plot_data["TimeLeft"]))
#
#			var dirt_name = "Dirt" + str(i)
#			if has_node(dirt_name):
#				var dirt = get_node(dirt_name)
#				dirt.add_child(plant1)
#				dirt.has_seed = true
#
#			Game.Plot.pop_at(i)
#			Utils.save_game()
#
#	var landPlot = Game.Plot.duplicate()  # Make a true copy so it's not affected by pops
#	print(Game.Harvests)
#	print(landPlot)
#	print(landPlot.size())
#
#	if landPlot.size() > 0:
#		for i in range(landPlot.size() - 1, -1, -1):  # Loop backward
#			var data = landPlot[i]
#			match (data["Seed"]):
#				"Corn":
#					var plant1 = Corn.instance()
#					plant1.PlantNum = i
#					plant1.stage = int(data["Stage"])
#					plant1.time = float(round(data["TimeLeft"]))
#					var dirt_name = "Dirt" + str(i)
#					if has_node(dirt_name):
#						get_child(i).add_child(plant1)
#						get_child(i).has_seed = true
#						Game.Plot.pop_at(i)
#						Utils.save_game()
#
#				"Tomato":
#					var plant1 = Tomatoe.instance()
#					plant1.PlantNum = i
#					plant1.stage = int(data["Stage"])
#					plant1.time = float(round(data["TimeLeft"]))
#					var dirt_name = "Dirt" + str(i)
#					if has_node(dirt_name):
#						get_child(i).add_child(plant1)
#						get_child(i).has_seed = true
#						Game.Plot.pop_at(i)
#						Utils.save_game()
#	if landPlot.size() > 0:
#		for i in landPlot.size():
#			if i != 0 :	
#				match (landPlot[i-1]["Seed"]):
#					"Corn":
#						Game.Plot.pop_at(i)
#						var plant1 = Corn.instance()
#						plant1.PlantNum = i
#						plant1.stage = int(landPlot[i-1]["Stage"])
#						plant1.time = (float(round(landPlot[i-1]["TimeLeft"])))
#						var dirt_name = "Dirt" + str(i)
#						if has_node(dirt_name):
#							get_child(i).add_child(plant1)
#							get_child(i).has_seed = true
#							Utils.save_game()
#
#					"Tomato":
#						Game.Plot.pop_at(i)
#						var plant1 = Tomatoe.instance()
#						plant1.PlantNum = i
#						plant1.stage = int(landPlot[i-1]["Stage"])
#						plant1.time = (float(round(landPlot[i-1]["TimeLeft"])))
#						var dirt_name = "Dirt" + str(i)
#						if has_node(dirt_name):
#							get_child(i).add_child(plant1)
#							get_child(i).has_seed = true
#							Utils.save_game()
#			else:
#				match (landPlot[i]["Seed"]):
#					"Corn":
#						#Game.Plot.pop_at(i)
#						var plant1 = Corn.instance()
#						plant1.PlantNum = i
#						plant1.stage = int(landPlot[i]["Stage"])
#						plant1.time = (float(round(landPlot[i]["TimeLeft"])))
#						var dirt_name = "Dirt" + str(i)
#						if has_node(dirt_name):
#							get_child(i).add_child(plant1)
#							get_child(i).has_seed = true
#							Game.Plot.pop_at(i)
#							Utils.save_game()
#
#					"Tomato":
#						#Game.Plot.pop_at(i)
#						var plant1 = Tomatoe.instance()
#						plant1.PlantNum = i
#						plant1.stage = int(landPlot[i]["Stage"])
#						plant1.time = (float(round(landPlot[i]["TimeLeft"])))
#						var dirt_name = "Dirt" + str(i)
#						if has_node(dirt_name):
#							get_child(i).add_child(plant1)
#							get_child(i).has_seed = true
#							Game.Plot.pop_at(i)
#							Utils.save_game()
