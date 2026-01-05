extends Node2D

@onready var highlight : Sprite2D = $Highlight
@onready var player: Player = $Player

func _on_till_tool_use(pos: Vector2) -> void:
	var grid_coords : Vector2i = Vector2i(int(pos.x / 16), int(pos.y / 16))
	$GameTilemap/TilledSoil.set_cells_terrain_connect([grid_coords], 0, 1)

func _process(delta: float) -> void:
	var mouse_pos = get_local_mouse_position()
	var coords = $GameTilemap/Props.local_to_map(mouse_pos)
	highlight_cell(coords)

func highlight_cell(cell_position : Vector2):
	highlight.position = $GameTilemap/Props.map_to_local(cell_position)
