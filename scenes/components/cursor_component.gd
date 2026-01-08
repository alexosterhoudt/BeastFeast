class_name CursorComponent
extends Node

@export var soil_tilemap_layer : TileMapLayer
@export var tilled_soil_tilemap_layer : TileMapLayer
@export var terrain_set : int = 0
@export var terrain : int = 1

@onready var player : Player = get_tree().get_first_node_in_group("player")

var mouse_pos : Vector2
var cell_pos : Vector2i
var cell_source : int
var local_cell_pos : Vector2
var distance : float

func _on_till_tool_use(pos: Vector2) -> void:
	mouse_pos = soil_tilemap_layer.get_local_mouse_position()
	cell_pos = soil_tilemap_layer.local_to_map(mouse_pos)
	cell_source = soil_tilemap_layer.get_cell_source_id(cell_pos)
	local_cell_pos = soil_tilemap_layer.map_to_local(cell_pos)
	distance = player.global_position.distance_to(local_cell_pos)
	
	if distance < 32.0 && cell_source != -1:
		tilled_soil_tilemap_layer.set_cells_terrain_connect([cell_pos], terrain_set, terrain, true)
