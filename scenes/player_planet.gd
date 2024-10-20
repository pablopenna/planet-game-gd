class_name PlayerPlanet extends Area3D

@export var speed = 10
@export var multiplier = 1.3

func _ready():
	area_entered.connect(_handle_collision)

func _process(delta):
	_handle_movement(delta)
	_handle_decay(delta)
	rotation.x += delta * _get_game_multiplier()
	
func _handle_movement(delta):
	var dir = Vector3.LEFT
	if Input.is_action_pressed("player_input"):
		dir = Vector3.RIGHT
	
	if (dir == Vector3.RIGHT and $LimitRight.is_on_screen()) or (dir == Vector3.LEFT and $LimitLeft.is_on_screen()):
		position += dir * speed * delta #* _get_game_multiplier()

func _handle_collision(area: Area3D):
	var planet = area as BasePlanet
	if planet != null:
		if planet.type == BasePlanet.Type.PLANET:
			self.scale += Vector3.ONE * 0.05 * _get_game_multiplier()
		if planet.type == BasePlanet.Type.STAR:
			self.scale -= Vector3.ONE * 0.2 * _get_game_multiplier()
		area.queue_free()
		EventBus.player_size_changed.emit(self.scale.x)

func _handle_decay(delta):
	self.scale -= Vector3.ONE * 0.02 * _get_game_multiplier() * delta
	EventBus.player_size_changed.emit(self.scale.x)

func _get_game_multiplier() -> float:
	return GameManager.get_multiplier() * multiplier
