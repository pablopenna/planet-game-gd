extends ProgressBar

func _ready() -> void:
	self.value = 0
	EventBus.score_progress_changed.connect(func(progress): self.value = progress)
