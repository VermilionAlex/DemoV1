extends Node2D


func _ready():
	#Utils.save_game()
	
	#Utils.load_game()
	var size = Game.Plot.size()
	var i = 0
	while i < size:
		match (Game.Plot[i]["Harvested"]):
			true:
				Game.Plot.pop_at(i)
				size -= 1
			false:
				pass
		i += 1

func _on_Button_pressed():
	get_tree().change_scene("res://World.tscn")





func _on_Settings_pressed():
	get_tree().change_scene("res://Settings.tscn")



func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")
