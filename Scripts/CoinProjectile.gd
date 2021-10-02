extends KinematicBody2D

var velocity = Vector2.ZERO
var direction = 1
var sprite_hidden = true
var timer_started = false

const THROW_VELOCITY = Vector2(1400, -1000)

func _ready():
	$Sprite.hide()
	launch()
	$AudioStreamPlayer2D.play()


func _physics_process(delta):
	if sprite_hidden:
		$Sprite.show()
		sprite_hidden = false
	velocity.y += Globals.GRAVITY *0.5 #* delta
	var collision = move_and_collide(velocity * delta)
	if collision != null or position.y > Globals.LEVEL_LIMIT:
		if not timer_started:
			$Timer.start()
			timer_started = true
		$Sprite.hide()
		$CollisionShape2D.disabled = true

func launch():
	velocity = THROW_VELOCITY * Vector2(direction, 1)


func _on_Timer_timeout():
	queue_free()
	 # Replace with function body.
