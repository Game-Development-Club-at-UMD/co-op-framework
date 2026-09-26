extends Control

## Determines player that the card is hooked up to.
@export_range(1, 4) var player_num: int = 1

@onready var sprite = $"Sprite2D"

func _ready() -> void:
	sprite.set_texture(load("res://Framework/Player Select Screen/assets/p" + str(player_num) + "_controls.png"))
