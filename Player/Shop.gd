extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Game.Unlocked == true:
		$"Shop Buy/Tomato/TomatoText/MarginContainer/LockTomato".text = str("Unlocked")
		$"Shop Buy/Tomato/PurchaseTomato".visible = false
	self.hide()
	
	



# Open and Close buttons
func _input(event):
	if event.is_action_pressed("Open_Shop"):
		if self.visible == true:
			self.hide()
		else:
			self.show()



func _on_SellButton_pressed():
	$"Shop Buy".visible = false
	$"Shop Sell".visible = true
	


func _on_BuyButton_pressed():
	
	$"Shop Sell".visible = false
	$"Shop Buy".visible = true




func _on_BuyExit_pressed():
	self.hide()


func _on_SellExit_pressed():
	self.hide()



	

func _on_PurchaseTomato_pressed():
	if Game.Gold >= 10 and Game.Unlocked == false:
		Game.Unlocked = true
		Game.Gold -= 10
		$"Shop Buy/Tomato/PurchaseTomato".visible = false
		$"Shop Buy/Tomato/TomatoText/MarginContainer/LockTomato".text = str("Unlocked")
	else:
		pass


func _on_SellButton1_pressed():
	
		for i in Game.Harvests.size():
			if "Corn" in Game.Harvests[i]["Name"]:
				if Game.Harvests[i]["Count"] >= 1:
					Game.Harvests[i]["Count"] -=1
					Game.Gold += 1
		



func _on_SellTtoe_pressed():
	if(Game.Unlocked):
		for i in Game.Harvests.size():
			if "Tomato" in Game.Harvests[i]["Name"]:
				if Game.Harvests[i]["Count"] >= 1:
					Game.Harvests[i]["Count"] -=1
					Game.Gold += 3
	else:
		pass
		
