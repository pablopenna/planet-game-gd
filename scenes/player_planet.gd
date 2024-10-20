class_name PlayerPlanet extends Node3D

@export var speed = 10
@export var area: Area3D

func _ready():
	area.area_entered.connect(_handle_collision)

func _process(delta):
	_handle_movement(delta)
	
func _handle_movement(delta):
	var dir = Vector3.LEFT
	if Input.is_action_pressed("player_input"):
		dir = Vector3.RIGHT
	
	if (dir == Vector3.RIGHT and $LimitRight.is_on_screen()) or (dir == Vector3.LEFT and $LimitLeft.is_on_screen()):
		position += dir * speed * delta

func _handle_collision(area: Area3D):
	var planet = area as BasePlanet
	if planet != null:
		if planet.type == BasePlanet.Type.PLANET:
			self.scale += Vector3.ONE * 0.05
		if planet.type == BasePlanet.Type.STAR:
			self.scale -= Vector3.ONE * 0.2
		area.queue_free()
	
