extends CharacterBody2D

@onready var sprite = $"Sprite2D"
@onready var tiny_sprite = $"Tiny Sprite"

var camera: Camera2D

const SPEED = 200
const DASH_MULTIPLIER = 2.0
const SNEAK_MULTIPLIER = 0.5

var player_number: int = 1

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed(CoopInput.get_player(player_number).Y):
		sprite.rotate(0.1)
	
	var baby_velocity: Vector2 = Input.get_vector(CoopInput.get_player(player_number).LEFT_RIGHT_STICK, CoopInput.get_player(player_number).RIGHT_RIGHT_STICK, CoopInput.get_player(player_number).UP_RIGHT_STICK, CoopInput.get_player(player_number).DOWN_RIGHT_STICK)
	tiny_sprite.position += baby_velocity
	
	var speed_multiplier = 1
	if Input.is_action_pressed(CoopInput.get_player(player_number).X):
		speed_multiplier = DASH_MULTIPLIER
	elif Input.is_action_pressed(CoopInput.get_player(player_number).B):
		speed_multiplier = SNEAK_MULTIPLIER
	velocity = SPEED * speed_multiplier * Input.get_vector(CoopInput.get_player(player_number).LEFT, CoopInput.get_player(player_number).RIGHT, CoopInput.get_player(player_number).UP, CoopInput.get_player(player_number).DOWN)
	move_and_slide()
	camera.position = position
	
	if Input.is_action_just_pressed(CoopInput.get_player(player_number).START) or Input.is_action_just_pressed(CoopInput.get_player(player_number).SELECT):
		process_mode = PROCESS_MODE_DISABLED
	

func set_player_num(player_num: int) -> void:
	player_number = player_num
	sprite.frame = player_num - 1
	position.x = player_number * 120 - 240
	

func set_camera(new_camera: Camera2D) -> void:
	camera = new_camera
