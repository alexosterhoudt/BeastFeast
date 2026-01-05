extends State

@export var idle_state : State
@export var move_state : State
var is_using : bool

signal tool_use(pos : Vector2)

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO
	is_using = true
	print(parent.last_direction)

func process_input(event: InputEvent) -> State:
	
	return null

func process_physics(delta : float) -> State:
	if is_using == false:
		return move_state
	return null

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "till" in anim_name:
		print("finished tilling")
		is_using = false

func tool_use_emit() -> void:
	tool_use.emit(parent.position + parent.last_direction * 16 + Vector2(0, 4))
