extends Node

var score = 1
var target_score = 5

func _ready() -> void:
	EventBus.player_size_changed.connect(_handle_score_change)

func _handle_score_change(score: float):
	self.score = score
	EventBus.score_changed.emit(score)
	EventBus.score_progress_changed.emit(_get_progress())
	
	if score > target_score or score < 0.5:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _get_progress():
	var progress = score / target_score * 100
	if progress == null:
		return 1
	else:
		return progress

func get_multiplier():
	var multiplier = 1 + _get_progress() / 100
	print(multiplier)
	return multiplier
