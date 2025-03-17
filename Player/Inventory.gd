extends Node2D


func _ready():
	self.hide()
	
func _input(event):
	if event.is_action_pressed("Open_Inventory"):
		if self.visible == true:
			self.hide()
		else:
			self.show()
