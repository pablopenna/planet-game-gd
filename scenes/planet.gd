class_name Planet extends Node3D

@export var speed = 15

func _process(delta):
	position += Vector3.BACK * speed * delta
