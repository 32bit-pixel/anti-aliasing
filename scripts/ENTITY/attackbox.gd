extends Area2D

@export var attack: Attack

@onready var parent: CharacterBody2D = get_parent()

func _on_area_entered(area: Area2D) -> void:
	if area.parent != parent:
		return
	print("THINGY")
	if area.has_method("damage"):
		area.damage(attack, parent.global_position)
