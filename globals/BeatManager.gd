extends Node

var bpm: int = 0
var bpms: int = 0

var timer: float = 0
var timer_ms: int = 0

func restart_beat():
	timer = 0.0

func on_beat() -> bool:
	return false

func _process(delta: float) -> void:
	timer += delta
	timer_ms = timer*1000
	bpms = (bpm/60)*1000
