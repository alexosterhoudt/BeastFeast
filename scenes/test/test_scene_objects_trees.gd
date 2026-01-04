extends Node2D

func _on_till_tool_use(pos: Vector2) -> void:
	var grid_coords : Vector2i = Vector2i(int(pos.x / 16), int(pos.y / 16))
	$GameTilemap/Soil.set_cells_terrain_connect([grid_coords], 0, 1)
