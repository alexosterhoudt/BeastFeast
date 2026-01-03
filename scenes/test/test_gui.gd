extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		self.visible = !self.visible
