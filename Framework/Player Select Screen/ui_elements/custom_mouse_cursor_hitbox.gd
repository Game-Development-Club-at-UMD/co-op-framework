extends Area2D

var highlighted_area: Area2D

func _on_area_entered(area: Area2D) -> void:
	highlighted_area = area

func _on_area_exited(_area: Area2D) -> void:
	highlighted_area = null

func _physics_process(_delta: float) -> void:
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("left_click") and highlighted_area != null:
		highlighted_area.clicked()
