extends Node
class_name FiniteStateMachine

var states: Dictionary = {} 
var prevstates: int = -1
var state: int = -1 setget set_state

onready var parent: Character = get_parent()
onready var animation_player: AnimationPlayer = parent.get_node("AnimationPlayer")

func _physics_process(delta: float) -> void: 
	if state != -1:
		_state_logic(delta)
		var transt: int = _get_transition()
		if transt != -1:
			set_state(transt)

func _state_logic(_delta: float) -> void:
	pass

func _get_transition() -> int:
	return -1

func _get_state(new_state: String) -> void:
	states[new_state] = states.size()

func set_state(new_state: int) -> void:
	_exit_state(state)
	prevstates = state
	state = new_state
	_enter_state(prevstates, state)
	
func _enter_state(prevstates: int, new_state: int) -> void:
	pass

func _exit_state(_state_exited: int) -> void:
	pass


