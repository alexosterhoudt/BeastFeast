class_name Player
extends CharacterBody2D

@onready var animations = $AnimationTree
@onready var state_machine: Node = $StateMachine
@onready var input_component: Node = $InputComponent

@export var move_speed : float = 50
@export var current_tool : DataTypes.Tools = DataTypes.Tools.None

var playback : AnimationNodeStateMachinePlayback
var direction : Vector2
var last_direction : Vector2

func _ready() -> void:
	playback = animations["parameters/playback"]
	state_machine.init(self, playback, input_component)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if direction:
		last_direction = direction
	update_animation_params()
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func update_animation_params():
	if(direction == Vector2.ZERO):
		return
	animations["parameters/Idle/blend_position"] = direction
	animations["parameters/Walk/blend_position"] = direction
	animations["parameters/Till/blend_position"] = direction
	animations["parameters/Chop/blend_position"] = direction
	animations["parameters/Water/blend_position"] = direction
