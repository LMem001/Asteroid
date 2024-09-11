extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const speed = 1000
	const range = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > range: 
		queue_free()


func _on_body_entered(body):
	print (body.name)
