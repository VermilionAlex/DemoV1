extends Node2D


func _ready():
	#self.hide()
	pass
func _input(event):
	if event.is_action_pressed("Open_Resource"):
		if self.visible == true:
			self.hide()
		else:
			self.show()
