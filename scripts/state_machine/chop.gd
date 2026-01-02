extends State

@export var idle_state : State
@export var hit_component_collision_shape : CollisionShape2D
var is_using : bool

func _ready() -> void:
	hit_component_collision_shape.disabled = true

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO
	is_using = true
	hit_component_collision_shape.disabled = false

func process_input(event: InputEvent) -> State:
	
	return null

func process_physics(delta : float) -> State:
	if is_using == false:
		hit_component_collision_shape.disabled = true
		hit_component_collision_shape.position = Vector2(0,0)
		return idle_state
	return null


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "chop" in anim_name:
		is_using = false
