extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_hoe: Button = $MarginContainer/HBoxContainer/ToolHoe
@onready var tool_can: Button = $MarginContainer/HBoxContainer/ToolCan

func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Axe)

func _on_tool_hoe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Hoe)

func _on_tool_can_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Can)
