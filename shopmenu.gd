extends StaticBody2D

#item 1 = berry 2
var item = 1

var item1price = 100
var item2price = 250

var item1owned = false
var item2owned = false

var price

func _ready():
	$icon.play("berryseed")
	item = 1
	
func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$icon.play("berryseed")
			$pricelabel.text = "100"
			if Global.coins >= item1price:
				if item1owned == false:
					$buybuttoncolor.color = "353ad31a"
				else:
					$buybuttoncolor.color = "2f473e3e"
			else:
				$buybuttoncolor.color = "2f473e3e"
				
		if item == 2:
			$icon.play("randomseed")
			$icon.play("berryseed")
			$pricelabel.text = "250"
			if Global.coins >= item2price:
				if item2owned == false:
					$buybuttoncolor.color = "353ad31a"
				else:
					$buybuttoncolor.color = "2f473e3e"
			else:
				$buybuttoncolor.color = "2f473e3e"
		
	

func _on_buttonleft_pressed():
	swap_item_back()
func _on_buttonright_pressed():
	swap_item_forward()
func _on_buybutton_pressed():
	if item == 1:
		price = item1price
		if Global.coins >= price:
			if item1owned == false:
				buy()
	elif item == 2:
		price = item2price
		if Global.coins >= price:
			if item2owned == false:
				buy()
	
func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1
func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1
	
func buy():
	Global.coins -= price
	if item == 1:
		item1owned = true
	if item  == 2:
		item2owned = true
		
