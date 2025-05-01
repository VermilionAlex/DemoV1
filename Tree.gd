extends YSort



var tree_scene = preload("res://Player/TreeHit.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var timerSet = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#var Checkposition = tree_scene.global_position
func _process(delta):
	#if Game.CheckDead and not $Timer.is_stopped():
	# Timer is already running; skip restarting it
		#return
	if(Game.CheckDead == true):
		#timerSet = true
		#$Timer.start()  # Starts the timer with its configured wait time
#		var plant1 = tree_scene.instance()
#		
#		plant1.position = Game.RespawnPosition  # Set the position where tree died
#		add_child(plant1)
#		Game.CheckDead = false
		
		var timer = Timer.new()
		timer.wait_time = 1.0  # Set the timer to 1 second
		timer.one_shot = true  # Optional: Makes the timer fire only once
		add_child(timer)  # Add the timer to the scene tree
		timer.start()  # Start the timer
		Game.CheckDead = false
		yield(timer, "timeout")
		timer.queue_free()
		var plant1 = tree_scene.instance()
		plant1.position = Game.RespawnPosition
		add_child(plant1)
		
		#timer.connect("timeout", timer, "queue_free")
	#print("CheckDead:", Game.CheckDead, " Timer running:", not $Timer.is_stopped())
#func _on_Timer_timeout():
#	var plant1 = tree_scene.instance()
#	plant1.position = Game.RespawnPosition
#	add_child(plant1)
#
