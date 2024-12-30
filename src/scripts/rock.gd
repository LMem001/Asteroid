extends RigidBody2D

var speed : float = 100.0
var possible_values = [0, 1, -1]
var x = 0
var y = 0

func _ready():
	x = get_random_value()
	y = get_random_value()

func _integrate_forces(state):
	gravity_scale = 0        # deactivate gravity that pulls mass towards the bottom of the screen
	linear_velocity = Vector2(x, y).normalized() * speed

func get_random_value():
	# decide randomly the value of x and y
	var rand = possible_values[randi() % possible_values.size()]
	# we don't want both x and y to be 0, so delete that position if it cames out once
	if rand == 0:
		possible_values.pop_front()
	return rand

func spawn_smaller_rocks(rock_scene, number):
	for i in range(number):
		var new_rock = rock_scene.instantiate() # Crea un'istanza della roccia
		new_rock.position = position + Vector2(randf_range(-10, 10), randf_range(-10, 10))
		get_parent().add_child(new_rock)
