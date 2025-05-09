class_name StateManager

var states

func _init():
	states = {
		"idle": IdleState,
		"run": Running,
		"chop": Chopping,
	}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No State ", state_name, " Exists")
