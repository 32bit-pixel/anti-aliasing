extends Node

@export var safe: int = 128;

var bpm: int = 0
var bpms: int = 0

var timer: float = 0
var timer_ms: int = 0

func restart_beat():
	timer = 0.0

func on_beat() -> bool:
	var mod = timer_ms % bpms
	if mod > bpms - safe/2 or mod < safe/2:
		return true
	else:
		return false

func _process(delta: float) -> void:
	timer += delta
	timer_ms = timer*1000
	bpms = (bpm/60)*1000
