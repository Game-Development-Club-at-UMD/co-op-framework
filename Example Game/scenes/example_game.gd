extends Node2D

var player = preload("res://Example Game/scenes/example_player.tscn")

## Starts the game with the given number of players, and an array of the players that did join.
func start(player_count: int, joined_players: Array[bool]) -> void:
	var stored_players = []
	
	# adds players to scene by player_num so they match their control scheme
	for i in joined_players.size():
		if joined_players[i]:
			var new_player = player.instantiate()
			add_child(new_player)
			new_player.set_player_num(i + 1)
			stored_players.append(new_player)
	
	# then iterates through player list to assign cameras by order so they match splitscreen set-up
	for i in stored_players.size():
		if player_count >= 3:
			Cameras.get_camera(i + 1).zoom = Vector2(0.5, 0.5)
		elif player_count == 2:
			Cameras.get_camera(i + 1).zoom = Vector2(0.75, 0.75)
		stored_players[i].set_camera(Cameras.get_camera(i + 1))
	
	# maybe zoom out cameras for when there's more players?
	
