extends Area2D


var dead = false

var health = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	material = $Sprite.material
	print(material)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#var sprite_global_pos = $Sprite.global_position

#func respawn_tree():
#	var sprite_global_pos = $Area2D.global_position  # Or $Sprite.global_position if needed
#
#	#var new_tree = tree_scene.instantiate()
#	var new_tree = get_node(".")
#	new_tree.position = sprite_global_pos
#	get_parent().add_child(new_tree)

func respawn(dead):
	if dead == true:
		#$treeTest.set_deferred("monitoring",true)
		var tree = Area2D.new()
		add_child(tree)
		




func _on_TreeHit_area_entered(area):
	if area.is_in_group("Axe"):
		health -= 10
		print(health)
		
		
		material.set_shader_param("shake_intensity",0.5)
		var timer = Timer.new()
		timer.wait_time = 1.0  # Set the timer to 1 second
		timer.one_shot = true  # Optional: Makes the timer fire only once
		add_child(timer)  # Add the timer to the scene tree
		timer.start()  # Start the timer

		yield(timer, "timeout")
		material.set_shader_param("shake_intensity",0)
		timer.connect("timeout", timer, "queue_free")
	if health <= 0:
#		dead = true
#		#$Sprite.visible = false
#		queue_free()
#		#self.visible = false
#		#$treeTest.set_deferred("monitoring",false)
#
#		respawn(dead)
		Game.RespawnPosition = global_position
		dead = true
		Game.CheckDead = true
		Game.Exp +=10
		Game.Gold+=1
		Game.levelUp()
		
#		get_parent().call_deferred("respawn_tree")  # Ask parent to respawn
		queue_free()
