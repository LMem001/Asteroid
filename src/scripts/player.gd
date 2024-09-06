extends CharacterBody2D
var initial_position = Vector2()
var rotation_speed = 4
var thrust : float = 0.0
var acceleration : float = 20.0 
var speed : float = 200.0 

func _physics_process(delta):
	_rotate(delta)
	if Input.is_action_pressed("thrust"):  # check if "thrust" is pressed
		thrust += acceleration * delta  
		var direction = Vector2.RIGHT.rotated(rotation) 
		velocity += Vector2.RIGHT.rotated(rotation) * thrust
	move_and_slide()
	#if Input.is_action_just_pressed("fire") and _bshot_timeout:
		#shot()
		## set timeout to prevent next shot
		#%ShotTimer.start(_gun_fire_rate)
		#_bshot_timeout = false

func _ready():
	initial_position = position
	
func _rotate(delta):
	if Input.is_action_pressed("rotate_left"):
		rotate(-rotation_speed * delta)  # Ruota in senso antiorario
	elif Input.is_action_pressed("rotate_right"):
		rotate(rotation_speed * delta)  # Ruota in senso orario
