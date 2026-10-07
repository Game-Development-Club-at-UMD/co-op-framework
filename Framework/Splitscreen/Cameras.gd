extends Node

@onready var P1: Node
@onready var P2: Node
@onready var P3: Node
@onready var P4: Node

## Returns camera based on given player_num. For example, write Cameras.get_camera(2) to get P2's camera.
## An invalid player number defaults to P1.
func get_camera(player_number: int) -> Node:
	# the reason this is a match case is because making an array lets devs access an array, which I don't want them to do
	match player_number:
		1: return P1
		2: return P2
		3: return P3
		4: return P4
	return P1
