extends KinematicBody2D

class_name PersistentState

var state
var state_manager

var velocity = Vector2()
var speed = 85


var direction = Vector2()

var chopping
#var hitArea = $AttackCollision/CollisionShape2D.position



func _ready():
	state_manager = StateManager.new()
	change_state("idle")
	$AttackCollision/CollisionShape2D.disabled = true
	
func get_input():
	Utils.save_game()
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		Game.Direction = Vector2.LEFT
		move_left()
		
		
	
	if Input.is_action_pressed("ui_right"):
		Game.Direction = Vector2.RIGHT
		move_right()
		
	if Input.is_action_pressed("ui_up"):
		Game.Direction = Vector2.UP
		move_up()
		
#		print(Game.Harvests)
#		print(Game.Plot)
#		print(Game.Plot.size())
#		print("check")
		
				
	if Input.is_action_pressed("ui_down"):
		Game.Direction = Vector2.DOWN
		move_down()
		
	
	if Input.is_action_just_pressed("chop") and Game.Direction == Vector2.DOWN:
		
		$AttackCollision/CollisionShape2D.disabled = false
		$AttackCollision/CollisionShape2D.position = Vector2(0,10)
		change_state("chop")
		chop_down()
		
	if Input.is_action_just_pressed("chop") and Game.Direction == Vector2.RIGHT:
		chopping = true
		$AttackCollision/CollisionShape2D.disabled = false
		$AttackCollision/CollisionShape2D.position = Vector2(9,2)
		
		change_state("chop")
		chop_right()
		
	if Input.is_action_just_pressed("chop") and Game.Direction == Vector2.UP:
		$AttackCollision/CollisionShape2D.disabled = false
		$AttackCollision/CollisionShape2D.position = Vector2(1,-11)
		change_state("chop")
		chop_up()
	if Input.is_action_just_pressed("chop") and Game.Direction == Vector2.LEFT:
		$AttackCollision/CollisionShape2D.disabled = false
		$AttackCollision/CollisionShape2D.position = Vector2(-9,2)
		change_state("chop")
		chop_left()
			
	
	#print(state)
	#print(direction)

	velocity = velocity.normalized()*speed
	
	
#Call on function and move based on input
func _process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	Game.CharPos = $Sprite.global_position
func move_up():
	state.move_up()
	
func move_down():
	state.move_down()
	
func move_left():
	state.move_left()
	
func move_right():
	state.move_right()
	
func chop_down():
	state.chop_down()
	
func chop_left():
	state.chop_left()
	
func chop_right():
	state.chop_right()
	
func chop_up():
	state.chop_up()


func change_state(new_state_name):
	#Have to free the state, since it doesn't automatically free the old state
	if state != null:
		state.queue_free()
	state = state_manager.get_state(new_state_name).new() 
	state.setup(funcref(self, "change_state"), $Sprite, self)
	state.name = str(new_state_name)
	add_child(state)
	




func _on_Sprite_animation_finished():
	if $Sprite.animation == "Chop Down" or $Sprite.animation == "Chop Left" or $Sprite.animation == "Chop Right" or $Sprite.animation == "Chop Up":
		chopping = false
		$AttackCollision/CollisionShape2D.disabled = true
		change_state("idle")
		
