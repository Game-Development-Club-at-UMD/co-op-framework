# This node is in control of handling player viewports for games.
extends Control

## Always 4, but I'd rather it be obvious when 4 shows up in code.
const MAX_PLAYER_COUNT = 4

@onready var grid_container: GridContainer = %"GridContainer"

@onready var player_viewport_containers: Array[SubViewportContainer] = [
	$"GridContainer/Player View P1",
	$"GridContainer/Player View P2",
	$"GridContainer/Player View P3",
	$"GridContainer/Player View P4"
]

## We should assign this to a base Node scene we create for them so they don't have to touch this part.
@export var game: PackedScene
## Set to false if you want all players to share the same screen.
@export var splitscreen: bool = true
## When true: screen is split by a | (vertically) when playing with 2 players.
## When false: screen is split by a - (horizontally) when playing with 2 players.
@export var vertical_2_player_splitscreen: bool = true
## Set to 0 to remove black lines between screens entirely, or increase if you want bigger lines between screens.
@export var splitscreen_line_thickness: int = 2
## Number of players. Purely for testing the framework because we'll implement a different way to modify this.
@export var player_count: int = 4

## This becomes the instantiated game scene. Referenced for cameras.
var world: Node

func _ready() -> void:
	grid_container.add_theme_constant_override("h_separation", splitscreen_line_thickness)
	grid_container.add_theme_constant_override("v_separation", splitscreen_line_thickness)
	world = game.instantiate()
	player_viewport_containers[0].add_game(game.instantiate())
	update_player_view_count()

## Modifies the number of viewports on screen to match the number of players.
func update_player_view_count() -> void:
	# handles layout of viewports by modifying columns
	if player_count >= 2:
		if player_count == 2 and !vertical_2_player_splitscreen:
			grid_container.columns = 1
		else:
			grid_container.columns = 2
	else:
		grid_container.columns = 1
	
	# iterates through every other viewport and sets their world to the world of the primary viewport, indexed at 0
	if player_count > 1:
		for i in range(1, player_count):
			player_viewport_containers[i].set_viewport_world_2d(player_viewport_containers[0].get_viewport_world_2d())
			player_viewport_containers[i].set_viewport_world_3d(player_viewport_containers[0].get_viewport_world_3d())
	# every unused viewport should be deactivated
	for i in range(0, MAX_PLAYER_COUNT):
		if i >= player_count:
			player_viewport_containers[i].hide()
		else:
			player_viewport_containers[i].show()

## This method is purely for testing. Reduces player count by 1 every time it times out, then updates screens to match.
func _on_timer_timeout() -> void:
	@warning_ignore("narrowing_conversion")
	player_count = move_toward(player_count, 0, 1)
	update_player_view_count()
