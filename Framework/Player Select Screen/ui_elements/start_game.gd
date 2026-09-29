extends TextureButton

@export var parent: Node

@onready var sprite = $"FakeSprite"

## When greater than 0, stays highlighted.
var bodies_inside: int = 0

## Called by child when clicked.
func clicked() -> void:
	parent.start_game()

func _on_area_2d_area_entered(_area: Area2D) -> void:
	bodies_inside += 1
	sprite.frame = 1

func _on_area_2d_area_exited(_area: Area2D) -> void:
	bodies_inside -= 1
	if !bodies_inside:
		sprite.frame = 0
