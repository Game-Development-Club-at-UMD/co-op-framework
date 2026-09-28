extends CharacterBody2D

@export var player_number: int = 1

@onready var sprite = $"Sprite2D"
## Assigns own player number to this node.
@onready var area = $"Area2D"

## Rises all the way to 1
var accel: float = 0

## Speed at which the cursor reaches full acceleration.
const ACCEL_SPEED: int = 4

## Movement speed of the cursor when at full speed.
const SPEED: int = 800

func _ready() -> void:
	sprite.frame = player_number - 1
	area.player_number = player_number
	deactivate()

## Used to show and start fetching inputs.
func activate(spawn_pos: Vector2) -> void:
	position = spawn_pos
	show()
	process_mode = Node.PROCESS_MODE_INHERIT

## Used to go away, loser.
func deactivate() -> void:
	accel = 0
	hide()
	process_mode = Node.PROCESS_MODE_DISABLED

func _physics_process(delta: float) -> void:
	if (Input.get_vector(CoopInput.get_player(player_number).LEFT, CoopInput.get_player(player_number).RIGHT, CoopInput.get_player(player_number).UP, CoopInput.get_player(player_number).DOWN)):
		accel = move_toward(accel, 1, delta * ACCEL_SPEED)
	else:
		accel = 0
	velocity = accel * SPEED * Input.get_vector(CoopInput.get_player(player_number).LEFT, CoopInput.get_player(player_number).RIGHT, CoopInput.get_player(player_number).UP, CoopInput.get_player(player_number).DOWN)
	move_and_slide()
