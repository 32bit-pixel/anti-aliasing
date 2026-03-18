extends Area2D

@export var attack: Attack

@onready var parent: CharacterBody2D = get_parent()

var attack_dir = -1

var attacking = false
var attacktime = 0.3
var attacktimer = 0.0

func attack_start() -> void:
	attacking = true
	attacktimer = attacktime

func _physics_process(delta: float) -> void:
	if attacktimer > 0.0:
		attacktimer -= delta
	else:
		attacking = false

	if attacking:
		visible = true
		monitoring = true
	else:
		visible = false
		monitoring = false

	if !attacking and attack_dir != 0:
		scale.x = attack_dir
		scale.y = attack_dir

func _on_area_entered(area: Area2D) -> void:
	if area.parent == parent:
		return
	print("THINGY")
	if area.has_method("damage"):
		area.damage(attack, parent.global_position)
