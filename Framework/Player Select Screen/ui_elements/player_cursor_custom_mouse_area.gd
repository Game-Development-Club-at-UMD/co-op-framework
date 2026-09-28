extends Area2D

var player_number: int = 1

var highlighted_area: Area2D

func _on_area_entered(area: Area2D) -> void:
	highlighted_area = area

func _on_area_exited(_area: Area2D) -> void:
	highlighted_area = null

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(CoopInput.get_player(player_number).A) and highlighted_area != null:
		highlighted_area.clicked()
