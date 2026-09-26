extends Node

@onready var P1: PlayerInput = PlayerInput.new()
@onready var P2: PlayerInput = PlayerInput.new()
@onready var P3: PlayerInput = PlayerInput.new()
@onready var P4: PlayerInput = PlayerInput.new()

## Returns player input based on given player_num. For example, write CoopInput.get_player(2).UP to detect P2's up input.
## An invalid player number defaults to P1.
func get_player(player_number: int) -> PlayerInput:
	# the reason this is a match case is because making an array lets devs access an array, which I don't want them to do
	match player_number:
		1: return P1
		2: return P2
		3: return P3
		4: return P4
	return P1
