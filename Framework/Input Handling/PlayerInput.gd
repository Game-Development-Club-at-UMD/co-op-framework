## Instances of this class are created by CoopInput to store corresponding inputs based on given input controller.
class_name PlayerInput extends Node

## Up direction on left joystick, or W/↑
@onready var UP: String = ""
## Down direction on left joystick, or S/↓
@onready var DOWN: String = ""
## Left direction on left joystick, or A/←
@onready var LEFT: String = ""
## Right direction on left joystick, or D/→
@onready var RIGHT: String = ""

## Bottom face button. Xbox A, Nintendo B, Sony Cross
@onready var A: String = ""
## Right face button. Xbox B, Nintendo A, Sony Circle
@onready var B: String = ""
## Right face button. Xbox X, Nintendo Y, Sony Square
@onready var X: String = ""
## Top face button. Xbox Y, Nintendo X, Sony Triangle
@onready var Y: String = ""

## Start button on controller, or esc/backspace
@onready var START: String = ""
## Select button on controller, or tab/enter
@onready var SELECT: String = ""

## Up direction on right joystick. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var UP_RIGHT_STICK: String = ""
## Down direction on right joystick. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var DOWN_RIGHT_STICK: String = ""
## Left direction on right joystick. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var LEFT_RIGHT_STICK: String = ""
## Right direction on right joystick. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var RIGHT_RIGHT_STICK: String = ""

## The left bumper (L1) on a controller. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var LEFT_BUMPER: String = ""
## The right bumper (R1) on a controller. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var RIGHT_BUMPER: String = ""
## The left trigger (L2) on a controller. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var LEFT_TRIGGER: String = ""
## The right trigger (R2) on a controller. Exclusive to controllers, so if you use these inputs, disable keyboard inputs for your game.
@onready var RIGHT_TRIGGER: String = ""

## Current assigned input name.
var _current_control_name: String = ""

const ACCEPTED_INPUT_NAMES: Array[String] = [
	"keyboard_wasd",
	"keyboard_arrow_keys",
	"controller_1",
	"controller_2",
	"controller_3",
	"controller_4"
]

## YOU SHOULD NEVER USE THIS. Run when a new player joins, and inputs must be assigned for their control type.
func _assign_inputs(input_type: String) -> void:
	if ACCEPTED_INPUT_NAMES.has(input_type):
		_current_control_name = input_type
		UP = input_type + "_up"
		DOWN = input_type + "_down"
		LEFT = input_type + "_left"
		RIGHT = input_type + "_right"
		A = input_type + "_a"
		B = input_type + "_b"
		X = input_type + "_x"
		Y = input_type + "_y"
		START = input_type + "_start"
		SELECT = input_type + "_select"
		# triggers controller-exclusive inputs
		if input_type.contains("controller"):
			UP_RIGHT_STICK = input_type + "_rs_up"
			DOWN_RIGHT_STICK = input_type + "_rs_down"
			LEFT_RIGHT_STICK = input_type + "_rs_left"
			RIGHT_RIGHT_STICK = input_type + "_rs_right"
			LEFT_BUMPER = input_type + "_left_bumper"
			RIGHT_BUMPER = input_type + "_right_bumper"
			LEFT_TRIGGER = input_type + "_left_trigger"
			RIGHT_TRIGGER = input_type + "_right_trigger"
		else:
			UP_RIGHT_STICK = "unassigned"
			DOWN_RIGHT_STICK = "unassigned"
			LEFT_RIGHT_STICK = "unassigned"
			RIGHT_RIGHT_STICK = "unassigned"
			LEFT_BUMPER = "unassigned"
			RIGHT_BUMPER = "unassigned"
			LEFT_TRIGGER = "unassigned"
			RIGHT_TRIGGER = "unassigned"
