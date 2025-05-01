extends State

class_name IdleState

func _ready():
	match Game.Direction:
		Vector2.DOWN:
			animation.play("idle")
		Vector2.UP:
			animation.play("idle Up")
		Vector2.LEFT:
			animation.play("idle Left")
		Vector2.RIGHT:
			animation.play("idle Right")
		_:
			animation.play("idle Down") # Default

func move_left():
	change_state.call_func("run")
	
func move_right():
	change_state.call_func("run")
	
func move_up():
	change_state.call_func("run")
	
func move_down():
	change_state.call_func("run")
	
	
	
func chop_down():	
	change_state.call_func("chop")
	
func chop_right():	
	change_state.call_func("chop")
	
func chop_up():	
	change_state.call_func("chop")
	
func chop_left():	
	change_state.call_func("chop")
