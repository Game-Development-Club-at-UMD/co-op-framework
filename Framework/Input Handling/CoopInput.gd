extends Node

@onready var P1: PlayerInput = PlayerInput.new()
@onready var P2: PlayerInput = PlayerInput.new()
@onready var P3: PlayerInput = PlayerInput.new()
@onready var P4: PlayerInput = PlayerInput.new()

## Returns player input based on given player_num. For example, write CoopInput.get_player(2).UP to detect P2's up input.
## An invalid player number defaults to P1.
func get_player(player_number: int) -> PlayerInput:
	# the reason this is a match case is because making an array lets devs access an array, which I don't want them to do
	match player_number:
		1: return P1
		2: return P2
		3: return P3
		4: return P4
	return P1



func _ready() -> void:
	# keyboard up
	if true:
		InputMap.add_action("keyboard_wasd_up")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_W
		InputMap.action_add_event("keyboard_wasd_up", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_up")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_UP
		InputMap.action_add_event("keyboard_arrow_keys_up", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	# keyboard down
	if true:
		InputMap.add_action("keyboard_wasd_down")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_S
		InputMap.action_add_event("keyboard_wasd_down", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_down")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_DOWN
		InputMap.action_add_event("keyboard_arrow_keys_down", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	# keyboard left
	if true:
		InputMap.add_action("keyboard_wasd_left")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_A
		InputMap.action_add_event("keyboard_wasd_left", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_left")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_LEFT
		InputMap.action_add_event("keyboard_arrow_keys_left", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	# keyboard right
	if true:
		InputMap.add_action("keyboard_wasd_right")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_D
		InputMap.action_add_event("keyboard_wasd_right", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_right")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_RIGHT
		InputMap.action_add_event("keyboard_arrow_keys_right", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	
	# keyboard "A"
	if true:
		InputMap.add_action("keyboard_wasd_a")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_B
		InputMap.action_add_event("keyboard_wasd_a", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_a")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_KP_2
		InputMap.action_add_event("keyboard_arrow_keys_a", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	# keyboard "B"
	if true:
		InputMap.add_action("keyboard_wasd_b")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_J
		InputMap.action_add_event("keyboard_wasd_b", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_b")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_KP_6
		InputMap.action_add_event("keyboard_arrow_keys_b", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	# keyboard "X"
	if true:
		InputMap.add_action("keyboard_wasd_x")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_G
		InputMap.action_add_event("keyboard_wasd_x", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_x")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_KP_4
		InputMap.action_add_event("keyboard_arrow_keys_x", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	# keyboard "Y"
	if true:
		InputMap.add_action("keyboard_wasd_y")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_Y
		InputMap.action_add_event("keyboard_wasd_y", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_y")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_KP_8
		InputMap.action_add_event("keyboard_arrow_keys_y", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	
	# keyboard "start"
	if true:
		InputMap.add_action("keyboard_wasd_start")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_ESCAPE
		InputMap.action_add_event("keyboard_wasd_start", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_start")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_BACKSPACE
		InputMap.action_add_event("keyboard_arrow_keys_start", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	# keyboard "select"
	if true:
		InputMap.add_action("keyboard_wasd_select")
		var input_wasd = InputEventKey.new()
		input_wasd.keycode = KEY_TAB
		InputMap.action_add_event("keyboard_wasd_select", input_wasd)
		InputMap.action_add_event("keyboard_wasd_join", input_wasd)
		
		InputMap.add_action("keyboard_arrow_keys_select")
		var input_keys = InputEventKey.new()
		input_keys.keycode = KEY_ENTER
		InputMap.action_add_event("keyboard_arrow_keys_select", input_keys)
		InputMap.action_add_event("keyboard_arrow_keys_join", input_keys)
	
	# controller setup
	for i in range(1, 5):
		_ready_setup_controller(i)

# Sets up input maps for controller by number. Done with code because there's too many inputs for me to bother writing out.
## You should never use this.
func _ready_setup_controller(num: int) -> void:
	# I kinda prefer 0.1 but whatever
	var deadzone: float = 0.2
	
	# an always-executes if statement makes it SO much easier to copy-paste
	# up
	if true:
		InputMap.add_action("controller_" + str(num) + "_up", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_LEFT_Y
		input.axis_value = -1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_up", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	# down
	if true:
		InputMap.add_action("controller_" + str(num) + "_down", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_LEFT_Y
		input.axis_value = 1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_down", input)
		InputMap.action_add_event("controller_" + str(num) + "_join_alt", input)
	# left
	if true:
		InputMap.add_action("controller_" + str(num) + "_left", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_LEFT_X
		input.axis_value = -1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_left", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	# right
	if true:
		InputMap.add_action("controller_" + str(num) + "_right", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_LEFT_X
		input.axis_value = 1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_right", input)
		InputMap.action_add_event("controller_" + str(num) + "_join_alt", input)
	
	# "a"
	if true:
		InputMap.add_action("controller_" + str(num) + "_a")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_A
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_a", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	# "b"
	if true:
		InputMap.add_action("controller_" + str(num) + "_b")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_B
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_b", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	# "y"
	if true:
		InputMap.add_action("controller_" + str(num) + "_y")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_Y
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_y", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	# "x"
	if true:
		InputMap.add_action("controller_" + str(num) + "_x")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_X
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_x", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	
	# start
	if true:
		InputMap.add_action("controller_" + str(num) + "_start")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_START
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_start", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	# select
	if true:
		InputMap.add_action("controller_" + str(num) + "_select")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_BACK
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_select", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	
	# rs up
	if true:
		InputMap.add_action("controller_" + str(num) + "_rs_up", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_RIGHT_Y
		input.axis_value = -1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_rs_up", input)
	# rs down
	if true:
		InputMap.add_action("controller_" + str(num) + "_rs_down", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_RIGHT_Y
		input.axis_value = 1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_rs_down", input)
	# rs left
	if true:
		InputMap.add_action("controller_" + str(num) + "_rs_left", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_RIGHT_X
		input.axis_value = -1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_rs_left", input)
	# rs right
	if true:
		InputMap.add_action("controller_" + str(num) + "_rs_right", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_RIGHT_X
		input.axis_value = 1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_rs_right", input)
	
	# left bumper
	if true:
		InputMap.add_action("controller_" + str(num) + "_left_bumper")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_LEFT_SHOULDER
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_left_bumper", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	# right bumper
	if true:
		InputMap.add_action("controller_" + str(num) + "_right_bumper")
		var input = InputEventJoypadButton.new()
		input.button_index = JOY_BUTTON_RIGHT_SHOULDER
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_right_bumper", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	
	# left trigger
	if true:
		InputMap.add_action("controller_" + str(num) + "_left_trigger", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_TRIGGER_LEFT
		input.axis_value = 1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_left_trigger", input)
		InputMap.action_add_event("controller_" + str(num) + "_join", input)
	
	# right trigger
	if true:
		InputMap.add_action("controller_" + str(num) + "_right_trigger", deadzone)
		var input = InputEventJoypadMotion.new()
		input.axis = JOY_AXIS_TRIGGER_RIGHT
		input.axis_value = 1.0
		input.device = num - 1
		InputMap.action_add_event("controller_" + str(num) + "_right_trigger", input)
		InputMap.action_add_event("controller_" + str(num) + "_join_alt", input)
