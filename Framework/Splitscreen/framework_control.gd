# This node is in control of handling player viewports for games.
extends Control

## Always 4, but I'd rather it be obvious when 4 shows up in code.
const MAX_PLAYER_COUNT = 4

@onready var grid_container: GridContainer = %"GridContainer"

@onready var player_view_p1: SubViewportContainer = %"Player View P1"
@onready var player_view_p2: SubViewportContainer = %"Player View P2"
@onready var player_view_p3: SubViewportContainer = %"Player View P3"
@onready var player_view_p4: SubViewportContainer = %"Player View P4"
@onready var player_viewport_containers: Array[SubViewportContainer] = [
	player_view_p1,
	player_view_p2,
	player_view_p3,
	player_view_p4
]

## The game starts with this screen to connect players before starting.
@onready var player_select_screen: PackedScene = preload("res://Framework/Player Select Screen/player_select_screen.tscn")
## We should assign this to a base Node scene we create for them so they don't have to touch this part.
@export var game: PackedScene = preload("res://Example Game/scenes/example_game.tscn")

## Set to false if you want all players to share the same screen.
@export var splitscreen: bool = true
## When true: screen is split by a | (vertically) when playing with 2 players.
## When false: screen is split by a - (horizontally) when playing with 2 players.
@export var vertical_2_player_splitscreen: bool = true
## Set to 0 to remove black lines between screens entirely, or increase if you want bigger lines between screens.
@export var splitscreen_line_thickness: int = 2
## Number of players. Used to set up splitscreen, and also passed into children.
var player_count: int = 4

## This becomes the player select scene once instantiated.
#var player_select: Node

## This becomes the instantiated game scene. Referenced for cameras.
# var world: Node

## Swaps between player_select and actual game world.
var child_scene: Node

func _ready() -> void:
	# readies cameras, individually instead of a loop to prevent writing a setter that devs might accidentally use
	Cameras.P1 = player_view_p1.get_camera()
	Cameras.P2 = player_view_p2.get_camera()
	Cameras.P3 = player_view_p3.get_camera()
	Cameras.P4 = player_view_p4.get_camera()
	# modifies grid container to match splitscreen preferences
	grid_container.add_theme_constant_override("h_separation", splitscreen_line_thickness)
	grid_container.add_theme_constant_override("v_separation", splitscreen_line_thickness)
	start_player_select()

## Modifies the number of viewports on screen to match the number of players.
func update_player_view_count() -> void:
	# if you aren't playing in splitscreen, disable the rest of the viewports and doesn't do anything else
	if !splitscreen:
		grid_container.columns = 1
		for i in range(1, MAX_PLAYER_COUNT):
			player_viewport_containers[i].hide()
		return
	
	# if you ARE playing in splitscreen, starts by capping player count
	player_count = clampi(player_count, 1, MAX_PLAYER_COUNT)
	
	# then handles layout of viewports by modifying columns
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
			player_viewport_containers[i].set_viewport_world_2d(player_view_p1.get_viewport_world_2d())
			player_viewport_containers[i].set_viewport_world_3d(player_view_p1.get_viewport_world_3d())
	# every unused viewport should be deactivated
	for i in range(0, MAX_PLAYER_COUNT):
		if i >= player_count:
			player_viewport_containers[i].hide()
		else:
			player_viewport_containers[i].show()

## Starts up player select.
func start_player_select() -> void:
	player_count = 1
	if child_scene != null:
		child_scene.queue_free()
	child_scene = player_select_screen.instantiate()
	child_scene.assign_framework_control(self)
	player_view_p1.add_game(child_scene)
	update_player_view_count()

## Starts up actual game.
func start_game(new_player_count: int, joined_players: Array[bool]) -> void:
	player_count = new_player_count
	if child_scene != null:
		child_scene.queue_free()
	child_scene = game.instantiate()
	player_view_p1.add_game(child_scene)
	# Game should have this method so we can give it player count.
	if child_scene.has_method("start"):
		child_scene.start(player_count, joined_players)
	update_player_view_count()

## This method is purely for testing. Reduces player count by 1 every time it times out, then updates screens to match.
func _on_timer_timeout() -> void:
	@warning_ignore("narrowing_conversion")
	player_count = move_toward(player_count, 0, 1)
	update_player_view_count()
