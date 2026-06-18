extends Marker3D

@export var mouse_sensitivity := 0.005
@export var min_pitch := -0.9
@export var max_pitch := 0.8

func _ready() -> void:
	# Hide and capture the mouse
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Rotate horizontally (around the player)
		rotation.y -= event.relative.x * mouse_sensitivity
		
		# Rotate vertically (pitch)
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clamp(rotation.x, min_pitch, max_pitch)
