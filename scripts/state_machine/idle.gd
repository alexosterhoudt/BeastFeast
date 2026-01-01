extends State

@export var move_state : State
@export var till_state : State
@export var chop_state : State
@export var water_state : State

func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO

func process_input(event: InputEvent) -> State:
	if (input_component.get_input_direction()):
		return move_state
	
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
	parent.move_and_slide()
	return null
