extends SubViewportContainer

@onready var subviewport = $"SubViewport"
@onready var camera = $"SubViewport/Camera2D"

func set_viewport_world_2d(new_world_2d: World2D) -> void:
	subviewport.world_2d = new_world_2d

func set_viewport_world_3d(new_world_3d: World3D) -> void:
	subviewport.world_3d = new_world_3d

func get_viewport_world_2d() -> World2D:
	return subviewport.world_2d

func get_viewport_world_3d() -> World3D:
	return subviewport.world_3d

func add_game(game: Node) -> void:
	subviewport.add_child(game)
