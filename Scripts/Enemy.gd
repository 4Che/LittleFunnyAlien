extends Area2D


func _ready():
	pass


func _on_Enemy_body_entered(body):
	if body.has_method("hurt"):
		get_tree().call_group("Rules", "hurt")
		body.hurt()


func _on_Area2D_body_entered(body):
	if body.is_in_group("Projectile"):
		$AudioStreamPlayer2D.play()
		$Timer.start()
		$CollisionShape2D.disabled = true
		$AnimatedSprite.hide()

func _on_Timer_timeout():
	get_parent().queue_free()
	#pass # Replace with function body.


func _on_StompDetector_area_entered(area):
	if area.global_position.y < get_parent().global_position.y:
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.hide()
		$CollisionShape2D.queue_free()
		$StompDetector.queue_free()
		$Timer.start()

