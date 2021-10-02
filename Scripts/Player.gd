extends KinematicBody2D

var linear_velocity = Vector2(0,0)
onready var sprite = $Sprite

var boost_mult = 2
var facing 

const SPEED = 800

const JUMP_SPEED = 2400

func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	move_and_slide(linear_velocity, Globals.UP)
	animate()
	attack()

func apply_gravity():
	if position.y > Globals.LEVEL_LIMIT:
		get_tree().call_group("Rules", "end_game") 
	if is_on_floor():
		linear_velocity.y = 0
	elif is_on_ceiling():
		linear_velocity.y = 1
	else:
		linear_velocity.y += Globals.GRAVITY
		
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		linear_velocity.x = -SPEED
		facing = "left"
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		linear_velocity.x = SPEED
		facing = "right"
	else:
		linear_velocity.x = 0
		
func jump():
	if Input.is_action_pressed("Jump") and is_on_floor():
		linear_velocity.y -= JUMP_SPEED
		$AudioPlayerJump.play()
func animate():
	if linear_velocity.y < 0:
		sprite.play("jump")
	elif linear_velocity.x > 0: #go right
		sprite.play("walk")
		sprite.flip_h = false
	elif linear_velocity.x < 0: #go left
		sprite.play("walk")
		sprite.flip_h = true
	else:
		sprite.play("idle")
		

	
func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	
	$AudioPlayerHurt.play()

func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	linear_velocity.y = -JUMP_SPEED * boost_mult
	
func attack():
	if Input.is_action_just_pressed("attack") and Globals.coins > 0:
		var projectile = load("res://Scenes/CoinProjectile.tscn").instance()
		if facing == "left":
			projectile.direction = -1
		else:
			projectile.direction = 1
		add_child(projectile)
		#projectile.set_as_toplevel(true)
		get_tree().call_group("Rules", "coin_dropped")
		$Sprite.animation = "jump"
		
