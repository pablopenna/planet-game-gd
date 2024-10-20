extends AudioStreamPlayer3D

@export var sounds: Array[AudioStream]

func _shuffle():
	self.stream = sounds[randi() % sounds.size()]


func _on_base_planet_created(planet: BasePlanet) -> void:
	if planet.type == BasePlanet.Type.STAR:
		_shuffle()
		play()
