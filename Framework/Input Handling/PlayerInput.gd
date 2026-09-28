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
## Bottom face button. Xbox A, Nintendo B, Sony Cross
@onready var A: String = "keyboard_wasd_a"
## Right face button. Xbox B, Nintendo A, Sony Circle
@onready var B: String = "keyboard_wasd_b"
## Right face button. Xbox X, Nintendo Y, Sony Square
@onready var X: String = "keyboard_wasd_x"
## Top face button. Xbox Y, Nintendo X, Sony Triangle
@onready var Y: String = "keyboard_wasd_y"

## Current assigned input name.
var current_control_name: String = ""

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
		current_control_name = input_type
		UP = input_type + "_up"
		DOWN = input_type + "_down"
		LEFT = input_type + "_left"
		RIGHT = input_type + "_right"
		A = input_type + "_a"
		B = input_type + "_b"
		X = input_type + "_x"
		Y = input_type + "_y"
