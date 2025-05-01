extends Node2D


var plotLoad= []

func _ready():
	#Utils.save_game()
	pass

func _on_Button_pressed():
	Utils.load_game()

	var size = Game.Plot.size()
	var i = 0
	while i < size:
		match (Game.Plot[i]["Harvested"]):
			true:
				pass
			false:
				plotLoad += [Game.Plot[i]]
		i += 1
	Game.Plot = plotLoad
	get_tree().change_scene("res://World.tscn")





func _on_Settings_pressed():
	get_tree().change_scene("res://MenuSections/Settings.tscn")



func _on_Credits_pressed():
	get_tree().change_scene("res://MenuSections/Credits.tscn")
