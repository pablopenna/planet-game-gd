extends WorldEnvironment

@export var rotation_speed = 0.05

func _process(delta):
	environment.sky_rotation.y += rotation_speed * delta 
