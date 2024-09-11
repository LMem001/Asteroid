extends CharacterBody2D
var initial_position = Vector2()
var rotation_speed = 4
var thrust : float = 0.0
var acceleration : float = 20.0 
var speed : float = 200.0
var _gun_fire_rate = 0.2
var _bshot_timeout = true

func _physics_process(delta):
	_rotate(delta)
	if Input.is_action_pressed("thrust"):  # check if "thrust" is pressed
		thrust += acceleration * delta  
		var direction = Vector2.RIGHT.rotated(rotation) 
		velocity += Vector2.RIGHT.rotated(rotation) * thrust
	if Input.is_action_just_pressed("shot") and _bshot_timeout:
		shot()
		# set timeout to prevent next shot
		%ShotTimer.start(_gun_fire_rate)
		_bshot_timeout = false
	move_and_slide()

func _ready():
	initial_position = position
	
func _rotate(delta):
	if Input.is_action_pressed("rotate_left"):
		rotate(-rotation_speed * delta)  # Ruota in senso antiorario
	elif Input.is_action_pressed("rotate_right"):
		rotate(rotation_speed * delta)  # Ruota in senso orario

func shot():
	const bullet = preload("res://src/scenes/bullet_player.tscn")
	var new_bullet = bullet.instantiate()
	new_bullet.position = %ShootingPoint.global_position
	# make the bullet follow the rotation of the player when instantiated
	new_bullet.rotation = rotation  
	# make the bullet son of the main the game scene, so it does not constantly follow the player
	get_parent().add_child(new_bullet) 


func _on_shot_timer_timeout():
	_bshot_timeout = true
