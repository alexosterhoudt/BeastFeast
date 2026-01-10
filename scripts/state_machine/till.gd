extends State

@export var idle_state : State
@export var move_state : State
var is_using : bool

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO
	is_using = true

func process_input(event: InputEvent) -> State:
	
	return null

func process_physics(delta : float) -> State:
	if is_using == false:
		return move_state
	return null

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "till" in anim_name:
		is_using = false
		
