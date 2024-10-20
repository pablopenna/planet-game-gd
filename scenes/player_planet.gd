class_name PlayerPlanet extends Node3D

@export var speed = 10

func _process(delta):
	var dir = Vector3.LEFT
	if Input.is_action_pressed("player_input"):
		dir = Vector3.RIGHT
	
	if (dir == Vector3.RIGHT and $LimitRight.is_on_screen()) or (dir == Vector3.LEFT and $LimitLeft.is_on_screen()):
		position += dir * speed * delta
	
	# print(position) # +- 16
