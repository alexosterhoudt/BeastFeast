extends State

@export var idle_state : State
@export var till_state : State
@export var chop_state : State
@export var water_state : State


func enter() -> void:
	super()

func process_input(event : InputEvent) -> State:
	match parent.current_tool:
		DataTypes.Tools.None:
			pass
		DataTypes.Tools.Hoe:
			if(input_component.get_input_use_tool()):
				return till_state
		DataTypes.Tools.Axe:
			if(input_component.get_input_use_tool()):
				return chop_state
		DataTypes.Tools.Can:
			if(input_component.get_input_use_tool()):
				return water_state
	
	return null

func process_physics(delta : float) -> State:
	parent.direction = input_component.get_input_direction()
	
	parent.velocity = parent.direction * parent.move_speed
	parent.move_and_slide()
	
	if(parent.velocity == Vector2.ZERO):
		return idle_state
	return null
