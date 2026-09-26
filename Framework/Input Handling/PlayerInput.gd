## Instances of this class are created by CoopInput to store corresponding inputs based on given input controller.
class_name PlayerInput extends Node

## Up direction on left joystick, or W/↑
@onready var UP: String = "keyboard_wasd_up"
## Down direction on left joystick, or S/↓
@onready var DOWN: String = "keyboard_wasd_down"
## Left direction on left joystick, or A/←
@onready var LEFT: String = "keyboard_wasd_left"
## Right direction on left joystick, or D/→
@onready var RIGHT: String = "keyboard_wasd_right"

const ACCEPTED_INPUT_NAMES: Array[String] = [
	"keyboard_wasd",
	"keyboard_arrow_keys",
	"controller_1",
	"controller_2",
	"controller_3",
	"controller_4"
]

## Run when a new player joins, and inputs must be assigned for their control type.
func assign_inputs(input_type: String) -> void:
	if ACCEPTED_INPUT_NAMES.has(input_type):
		UP = input_type + "_up"
		DOWN = input_type + "_down"
		LEFT = input_type + "_left"
		RIGHT = input_type + "_right"
