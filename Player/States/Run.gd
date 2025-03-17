extends State


# Character Game state for movement
class_name Running


#Get input for commands, WASD and arrow key movement
func get_input():
	if Input.is_action_just_released("ui_left"):
		change_state.call_func("idle")
	if Input.is_action_just_released("ui_right"):
		change_state.call_func("idle")
	if Input.is_action_just_released("ui_down"):
		change_state.call_func("idle")
	if Input.is_action_just_released("ui_up"):
		change_state.call_func("idle")

# Call function 
func _physics_process(delta):
	get_input()


#Changes our character position and plays animations

func move_down():
	persistent_state.velocity.y += 1
	animation.play("Walk Down")
func move_up():
	persistent_state.velocity.y -= 1
	animation.play("Walk Up")
func move_left():
	persistent_state.velocity.x -= 1
	animation.play("Walk Left")
func move_right():
	persistent_state.velocity.x += 1
	animation.play("Walk Right")


