extends Node3D

@export var planet_scene: PackedScene
@export var _timer: Timer
@export var speed_multiplier = 1.2
@export var spawn_speed_multiplier = 0.5
@export var initial_spawn_time = 1

func _ready():
	_timer.timeout.connect(_spawn_planet)
	EventBus.score_progress_changed.connect(func(_progress): _timer.wait_time = initial_spawn_time - get_spawn_speed_multiplier())

func _spawn_planet():
	var planet: Node3D = planet_scene.instantiate()
	add_child(planet)
	
	planet.global_position = self.global_position
	planet.global_position.x += randi_range(-15, 15)
	planet.multiplier = speed_multiplier
	

func get_spawn_speed_multiplier() -> float:
	return GameManager.get_multiplier() * spawn_speed_multiplier
