extends CharacterBody2D

@onready var sprite = $"Sprite2D"

var camera: Camera2D

const SPEED = 200

var player_number: int = 1

func _physics_process(_delta: float) -> void:
	velocity = SPEED * Input.get_vector(CoopInput.get_player(player_number).LEFT, CoopInput.get_player(player_number).RIGHT, CoopInput.get_player(player_number).UP, CoopInput.get_player(player_number).DOWN)
	move_and_slide()
	camera.position = position

func set_player_num(player_num: int) -> void:
	player_number = player_num
	sprite.frame = player_num - 1
	position.x = player_number * 120 - 240
	

func set_camera(new_camera: Camera2D) -> void:
	camera = new_camera
