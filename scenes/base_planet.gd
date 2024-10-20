class_name BasePlanet extends Area3D

enum Type {
	PLANET,
	STAR
}

var path_to_planets_dir = "res://scenes/planets"
@export var planets: Array[PackedScene]
@export var stars: Array[PackedScene]
@export var speed = 15
@export var multiplier = 1.2
@export var screen_notifier: VisibleOnScreenNotifier3D
var type: Type

signal created(planet: BasePlanet)

func _ready():
	_load_planet_mesh2()
	screen_notifier.screen_exited.connect(func(): queue_free())
	if type == Type.STAR:
		self.scale *= 1.2
		self.speed *= 1.5
	
	created.emit(self)

func _process(delta):
	position += Vector3.BACK * speed * delta * _get_game_multiplier() 
	rotation.x += delta * _get_game_multiplier()

func _load_planet_mesh():
	var planets_dir = DirAccess.open(path_to_planets_dir)
	
	planets_dir.list_dir_begin()
	var all_planets = planets_dir.get_files()
	var random_planet = all_planets[randi() % all_planets.size()]
	type = Type.STAR if random_planet.contains("star") else Type.PLANET
	planets_dir.list_dir_end()
	
	add_child(load(path_to_planets_dir + "/" +random_planet).instantiate())

func _load_planet_mesh2():
	type = Type.PLANET if randi() % 2 == 0 else Type.STAR
	var random
	if type == Type.PLANET:
		random = planets[randi() % planets.size()]
	else:
		random = stars[randi() % stars.size()]
	add_child(random.instantiate())

func _get_game_multiplier():
	return GameManager.get_multiplier() * multiplier
