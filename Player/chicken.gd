extends Area2D

var speed = 50
var health = 20

func _ready():
	
	pass

func _physics_process(delta):
	if typeof(Game.CharPos) == TYPE_VECTOR2: 
		var direction = (Game.CharPos - global_position).normalized()
		
		# Update position toward the player's position
		position += direction * speed * delta

		# Face the player's current position
		if (Game.CharPos - position).length() <= 20:
			speed = 0
		else: 
			speed = 50
		look_at(Game.CharPos)
		
		







func _on_chicken_area_entered(area):
	if area.is_in_group("Axe"):
		health -= 10
		#print(health)
		

		$Sprite.modulate = Color(1, 0, 0) 

	if health <= 0:

		queue_free()
