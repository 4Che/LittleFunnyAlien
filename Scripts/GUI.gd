extends CanvasLayer


func _ready():
	pass

func add_lives(lives_count):
	while lives_count > $Control/HeartsContainer.get_child_count():
		$Control/HeartsContainer.add_child(load("res://Scenes/heart_1.tscn").instance())
	

func remove_lives(lives_count):
	if lives_count < $Control/HeartsContainer.get_child_count():
		var heart = $Control/HeartsContainer.get_child(0)
		heart.queue_free()

func add_coins(coins_amount):
	$Control/HeartsContainer2/Label.text = str(coins_amount)
	


#update_lives(lives_count):
#	if lives_count == 2:
#		$Control/HeartsContainer/heart_3.hide()
#	elif lives_count == 1:
#		$Control/HeartsContainer/heart_2.hide()
