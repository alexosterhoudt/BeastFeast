extends Node2D

@onready var highlight : Sprite2D = $Highlight
@onready var player: Player = $Player
var distance : float

func _process(delta: float) -> void:
	var mouse_pos = get_local_mouse_position()
	var coords = $GameTilemap/Props.local_to_map(mouse_pos)
	var local_cell_pos = $GameTilemap/Props.map_to_local(coords)
	distance = player.global_position.distance_to(local_cell_pos)
	highlight_cell(distance, coords)

func highlight_cell(distance : float, cell_position : Vector2):
	if distance < 32.0:
		highlight.position = $GameTilemap/Props.map_to_local(cell_position)

func _on_player_tool_use(tool: DataTypes.Tools, pos: Vector2) -> void:
	var grid_coords : Vector2i = Vector2i(int(pos.x / DataTypes.TILE_SIZE), int(pos.y / DataTypes.TILE_SIZE))
	match tool:
		DataTypes.Tools.Hoe:
			
			$GameTilemap/TilledSoil.set_cells_terrain_connect([grid_coords], 0, 1)
