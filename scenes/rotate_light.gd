extends DirectionalLight3D

@export var rotation_speed = 0.05

func _process(delta):
	rotation.y += rotation_speed * delta 
