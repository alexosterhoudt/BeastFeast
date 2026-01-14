extends ColorRect

func _get_drag_data(position):
	print("DRAG STARTED")
	var preview := ColorRect.new()
	preview.color = Color.RED
	preview.custom_minimum_size = Vector2(50, 50)
	set_drag_preview(preview)
	return {}

func _can_drop_data(position, data):
	print("CAN DROP")
	return true

func _drop_data(position, data):
	print("DROPPED")
