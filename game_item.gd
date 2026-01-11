class_name GameItem
extends Node2D

var data : ItemData

func setup(_data : ItemData):
	data = _data
	$Sprite2D.texture = data.icon
	
func _ready() -> void:
	$Area2D.body_entered.connect(_on_area_2d_body_entered)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Picked up: ", data.display_name)
		queue_free()
