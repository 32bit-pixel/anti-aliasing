extends Node

@export var safe: int = 128

var bpm: int = 0
var ms_per_beat: float = 0.0

var timer_ms: float = 0.0

func set_bpm(value: int) -> void:
	bpm = value
	if bpm > 0:
		ms_per_beat = 60000.0 / bpm
	else:
		ms_per_beat = 0.0
	restart_beat()

func restart_beat() -> void:
	timer_ms = 0.0

func on_beat(beat_safe) -> bool:
	if ms_per_beat == 0:
		return false

	var mod = fmod(timer_ms, ms_per_beat)
	
	if beat_safe <= 0:
		if mod > ms_per_beat - safe * 0.5 or mod < safe * 0.5:
			return true
	else:
		if mod > ms_per_beat - beat_safe * 0.5 or mod < beat_safe * 0.5:
			return true

	return false

func _process(delta: float) -> void:
	timer_ms += delta * 1000.0
