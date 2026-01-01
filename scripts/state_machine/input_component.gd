extends Node

func get_input_direction() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")

func get_input_use_tool() -> bool:
	return Input.is_action_just_pressed("use_tool")
