extends Area2D

@export var max_health: int = 100

var health: int = 0

@onready var parent: CharacterBody2D = get_parent()

func _ready() -> void:
	health = max_health

func damage(attack: Attack, pos: Vector2):
	if BM.on_beat():
		health -= attack.damage * 2
		print("Big Owie")
	else:
		health -= attack.damage
		print("Owie")
	
	if health <= 0:
		if parent.has_method("death"):
			parent.death()
