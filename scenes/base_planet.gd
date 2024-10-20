extends Node3D

var path_to_planets_dir = "res://scenes/planets"
@export var speed = 15

func _ready():
	_load_planet_mesh()

func _process(delta):
	position += Vector3.BACK * speed * delta

func _load_planet_mesh():
	var planets_dir = DirAccess.open(path_to_planets_dir)
	
	planets_dir.list_dir_begin()
	var all_planets = planets_dir.get_files()
	var random_planet = all_planets[randi() % all_planets.size()]
	planets_dir.list_dir_end()
	
	add_child(load(path_to_planets_dir + "/" +random_planet).instantiate())
