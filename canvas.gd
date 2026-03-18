extends CanvasLayer

@onready var beat_color = $Debug/VBoxContainer/Beat
@onready var beat_safe = $Debug/VBoxContainer/SAFE


func _physics_process(delta: float) -> void:
	if BM.on_beat(int(beat_safe.text)):
		beat_color.color = Color(0.0, 1.0, 0.0, 1.0)
	else:
		beat_color.color = Color(1.0, 0.0, 0.0, 1.0)
