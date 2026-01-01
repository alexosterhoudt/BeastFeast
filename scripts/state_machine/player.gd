class_name Player
extends CharacterBody2D

@onready var animations = $AnimationTree
@onready var state_machine: Node = $StateMachine
@onready var input_component: Node = $InputComponent

@export var move_speed : float = 50
@export var current_tool : DataTypes.Tools = DataTypes.Tools.None

var playback : AnimationNodeStateMachinePlayback
var direction : Vector2

func _ready() -> void:
	playback = animations["parameters/playback"]
	state_machine.init(self, playback, input_component)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
