class_name Player
extends CharacterBody2D

@onready var animations = $AnimationTree
@onready var state_machine: Node = $StateMachine
@onready var input_component: Node = $InputComponent
@onready var hit_component: HitComponent = $HitComponent
@onready var inventory: Inventory = $Inventory

@export var move_speed : float = 50
@export var current_tool : DataTypes.Tools = DataTypes.Tools.None

var playback : AnimationNodeStateMachinePlayback
var direction : Vector2
var last_direction : Vector2

signal tool_use(tool : DataTypes.Tools, pos : Vector2)

func _ready() -> void:
	playback = animations["parameters/playback"]
	state_machine.init(self, playback, input_component)
	ToolManager.tool_selected.connect(on_tool_selected)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if direction:
		last_direction = direction
	update_animation_params()
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func on_tool_selected(tool : DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool

func update_animation_params():
	if(direction == Vector2.ZERO):
		return
	animations["parameters/Idle/blend_position"] = direction
	animations["parameters/Walk/blend_position"] = direction
	animations["parameters/Till/blend_position"] = direction
	animations["parameters/Chop/blend_position"] = direction
	animations["parameters/Water/blend_position"] = direction

func tool_use_emit():
	tool_use.emit(current_tool, position + last_direction * 16 + Vector2(0, 4))

func pickup_item(item_data : ItemData) -> void:
	inventory.add_item(item_data)
