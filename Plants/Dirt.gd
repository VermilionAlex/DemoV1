extends Area2D


const Corn = preload("res://Plants/Corn.tscn")
const Tomatoe = preload("res://Plants/Tomato.tscn")





var has_seed = false



#view port allows object to be seen
#"shape_idx is the child index of the newly entered Shape2D" mouse shape allowed in region
func _on_Dirt_input_event(viewport, event, shape_idx):
	if !has_seed:
		if event.is_action("Spawn"):
			print(Game.Harvests)
			print(Game.Plot)
				
			match Game.Selected:
				0:
					var plant1 = Corn.instance()
					self.add_child(plant1)
					has_seed = true
				1:
					var plant1 = Tomatoe.instance()
					self.add_child(plant1)
					has_seed = true
