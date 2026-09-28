extends Node2D

var player = preload("res://Example Game/scenes/example_player.tscn")

## Starts the game with the given number of players.
func start(number_of_players: int) -> void:
	for i in number_of_players:
		var new_player = player.instantiate()
		add_child(new_player)
		new_player.set_player_num(i + 1)
