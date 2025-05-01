extends State

class_name Chopping


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#func get_input():
#	if Input.is_action_just_released("chop"):
#		change_state.call_func("idle")
#
#
#
## Call function 
#func _physics_process(delta):
#	get_input()

var finished = false

func _ready():
	finished = false
	if animation and not animation.is_connected("animation_finished", self, "_on_animation_finished"):
		animation.connect("animation_finished", self, "_on_animation_finished")

func _physics_process(delta):
	# No input checking here 
	if finished:
		change_state.call_func("idle")

#func _physics_process(delta):
#	get_input()
func move_left():
	change_state.call_func("run")
	
func move_right():
	change_state.call_func("run")
	
func move_up():
	change_state.call_func("run")
	
func move_down():
	change_state.call_func("run")
	
func chop_down():	
	
	animation.play("Chop Down")
	


	
func chop_up():
	animation.play("Chop Up")
	
func chop_left():
	animation.play("Chop Left")
	
func chop_right():
	
	animation.play("Chop Right")
	
func _on_animation_finished():
	finished = true
