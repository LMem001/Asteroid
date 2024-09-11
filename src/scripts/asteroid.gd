extends Node2D
@export var canvas_layer : CanvasLayer
@export var player : CharacterBody2D
var canvas_size : Vector2

func _physics_process(delta):
	# wrap player when exits from canvas layer
	_wrap_around(player)
	
	for rock in get_tree().get_nodes_in_group("gRock"):
		#rock._change_direction()
		_wrap_around(rock)

func _ready():
	# Ottieni la dimensione del CanvasLayer
	canvas_size = get_canvas_layer_size()


func get_canvas_layer_size() -> Vector2:
	var viewport = get_viewport()
	var viewport_transform = viewport.get_canvas_transform()
	return viewport.size

# Wrapping function based on the CanvasLayer size
func _wrap_around(obj):
	# Check if the object is out of the horizontal bounds
	if obj.position.x < 0:
		obj.position.x = canvas_size.x
	elif obj.position.x > canvas_size.x:
		obj.position.x = 0

	# Check if the object is out of the vertical bounds
	if obj.position.y < 0:
		obj.position.y = canvas_size.y
	elif obj.position.y > canvas_size.y:
		obj.position.y = 0
