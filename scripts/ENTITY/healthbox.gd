extends Area2D

@export var max_health: int = 100

var health: int = 0

@onready var parent: CharacterBody2D = get_parent()

func _ready() -> void:
	health = max_health

func damage(attack: Attack, pos: Vector2):
	if BM.on_beat(attack.beat_safe):
		health -= roundi(attack.damage * attack.beat_mult)
		print("Big Owie")
	else:
		health -= attack.damage
		print("Owie")

	var relative := (parent.global_position - pos)
	
	relative = Vector2(relative.x, min(relative.x, -relative.x)/2).normalized()

	parent.velocity += relative * attack.knockback_coeff

	if health <= 0:
		if parent.has_method("death"):
			parent.death()
