extends Area2D

@export var max_health: int = 100

var health: int = 0

@onready var parent: CharacterBody2D = get_parent()

func _ready() -> void:
	health = max_health

func damage(attack: Attack, pos: Vector2):
	var knock = 0.0
	if BM.on_beat(attack.beat_safe):
		health -= roundi(attack.damage * attack.beat_mult * attack.combo * attack.combo_coeff)
		knock = 1.0
		print("Big Owie")
		attack.combo += 1
	else:
		health -= attack.damage * 0.25
		knock = 0.25
		print("Owie")
		attack.combo = 0

	var relative := (parent.global_position - pos)
	
	relative = Vector2(relative.x, min(relative.x, -relative.x)/2).normalized()

	parent.velocity += relative * attack.knockback_coeff * knock

	if health <= 0:
		if parent.has_method("death"):
			parent.death()
