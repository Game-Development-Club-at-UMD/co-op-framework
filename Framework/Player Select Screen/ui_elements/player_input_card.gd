extends Control

## Determines player that the card is hooked up to.
@export_range(1, 4) var player_num: int = 1

@onready var sprite = $"Sprite2D"
@onready var timer = $"InputHint Timer"
@onready var anim = $"AnimationPlayer"
@onready var disconnect_button = $"Disconnect"

## When true, this player needs to connect to the game for it to start.
var needs_to_exist_to_play_game: bool = false

## When true, you can disconnect.
var connected: bool = false

## Loaded when player MUST exist for the game to run, or whenever the player is joined.
@onready var connected_texture: Texture = load("res://Framework/Player Select Screen/assets/p" + str(player_num) + "_controls.png")
## Loaded whenever the player is disconnected and doesn't need to join for the game to start.
@onready var disconnected_texture: Texture = load("res://Framework/Player Select Screen/assets/gray_controls.png")

var player_select_screen: Node

## Determines what inputs are hinted when no player is connected.
## 1 represents keyboard_wasd, 2 represents keyboard_arrow_keys, 3 represents controller.
var allowed_input_methods = []

## Setter. When true, this player needs to connect to the game for it to start.
func set_needs_to_exist_to_play_game(needs_to: bool) -> void:
	needs_to_exist_to_play_game = needs_to

## Runs when controller is connected. Matches visual to the controller being used.
func connect_control_type(control_type: String) -> void:
	match control_type:
		"keyboard_wasd": sprite.frame = 1
		"keyboard_arrow_keys": sprite.frame = 2
		_: sprite.frame = 3
	sprite.set_texture(connected_texture)
	timer.stop()
	anim.stop(true)
	anim.play("connect")
	connected = true

## Runs when controller is disconnected. Stays colored if player must be connected for the game to start (like P1).
func disconnect_control_type() -> void:
	sprite.frame = 0
	if !true:#needs_to_exist_to_play_game:
		sprite.set_texture(connected_texture)
	else:
		sprite.set_texture(disconnected_texture)
	_on_input_hint_timer_timeout()
	anim.stop(true)
	anim.play("disconnect")
	connected = false

## Sets the controls that this input card will hint at.
func set_valid_controls(wasd: bool, arrow_keys: bool, controller: bool) -> void:
	if wasd:
		allowed_input_methods.append(1)
	if arrow_keys:
		allowed_input_methods.append(2)
	if controller:
		allowed_input_methods.append(3)

## On timeout, switches frame to one of the available input methods.
func _on_input_hint_timer_timeout() -> void:
	var current_index: int = allowed_input_methods.find(sprite.frame)
	if current_index == -1:
		current_index = 0
	else:
		current_index += 1
		if current_index >= allowed_input_methods.size():
			current_index = 0
	
	if allowed_input_methods.is_empty():
		# your game doesn't allow inputs!
		sprite.frame = 0
	else:
		sprite.frame = allowed_input_methods[current_index]
	# written this way to make the animation prettier when connecting/disconnecting
	timer.start()

## Runs whenever disconnect is pressed, either by mouse or cursor.
func disconnect_pressed() -> void:
	if connected and player_select_screen != null:
		player_select_screen.remove_player(player_num)

func _on_texture_button_pressed() -> void:
	disconnect_pressed()

func set_player_select_screen(screen: Node) -> void:
	player_select_screen = screen
