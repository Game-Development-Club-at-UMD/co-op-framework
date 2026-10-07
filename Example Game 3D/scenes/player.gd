extends CharacterBody3D

@onready var mesh = $"MeshInstance3D"
@onready var camera_pivot = $"Camera Pivot"

var camera: Camera3D

var player_number: int = 1

var current_grav: float

const JUMP_BUFFER_MAX: float = 0.1
var jump_buffer: float = 0

const JUMP_HEIGHT: float = 20.0
## Used to cut off jump height when jump button is no longer held.
const JUMP_CUTOFF_TRACTION: float = 0.8

const MAX_SPEED: float = 10.0
const GRAV: float = -40.0
const GROUND_ACCEL: float = 120.0

func _physics_process(delta: float) -> void:
	
	# input buffering
	if Input.is_action_just_pressed(CoopInput.get_player(player_number).A):
		jump_buffer = JUMP_BUFFER_MAX
	else:
		jump_buffer = move_toward(jump_buffer, 0, delta)
	
	if is_on_floor():
		if jump_buffer:
			jump_buffer = 0
			current_grav = JUMP_HEIGHT
		else:
			current_grav = 0.0
	elif is_on_ceiling() and current_grav > 0:
		current_grav = 0
	else:
		current_grav += GRAV * delta
		if current_grav > 0 and !Input.is_action_pressed(CoopInput.get_player(player_number).A):
			current_grav *= JUMP_CUTOFF_TRACTION
	
	var raw_input_dir = Input.get_vector(CoopInput.get_player(player_number).LEFT, CoopInput.get_player(player_number).RIGHT, CoopInput.get_player(player_number).DOWN, CoopInput.get_player(player_number).UP)
	var cooked_input_dir = Vector3.ZERO
	
	var cam_rot: float = camera.rotation.y
	# forward and back
	cooked_input_dir.z -= raw_input_dir.y * cos(cam_rot)
	cooked_input_dir.x -= raw_input_dir.y * sin(cam_rot)
	# left and right
	cooked_input_dir.z -= raw_input_dir.x * sin(cam_rot)
	cooked_input_dir.x += raw_input_dir.x * cos(cam_rot)
	
	velocity = velocity.move_toward(cooked_input_dir * MAX_SPEED, GROUND_ACCEL * delta)
	velocity.y = current_grav
	move_and_slide()
	camera.position = camera_pivot.global_position

func set_player_num(player_num: int) -> void:
	player_number = player_num
	#mesh.material = load("res://Example Game 3D/assets/material_p" + str(player_number) + ".tres")
	position.y = 1
	position.x = player_number * 4

func set_camera(new_camera: Camera3D) -> void:
	camera = new_camera
