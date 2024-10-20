extends Node3D

@export var planet_scene: PackedScene
@export var _timer: Timer

func _ready():
	_timer.timeout.connect(_spawn_planet)

func _spawn_planet():
	var planet: Node3D = planet_scene.instantiate()
	add_child(planet)
	
	planet.global_position = self.global_position
	planet.global_position.x += randi_range(-15, 15)
