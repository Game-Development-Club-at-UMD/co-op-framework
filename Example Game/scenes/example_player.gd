extends CharacterBody2D

@export var player_number: int = 1

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed(CoopInput.get_player(player_number).UP):
		print("horray")
