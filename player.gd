extends CharacterBody2D

const SPEED = 800.0
const JUMP_VELOCITY = -400.0

func lerp_vec2(a: Vector2, b: Vector2, t: float) -> Vector2:
	return Vector2(lerpf(a.x, b.x, t), lerpf(a.y, b.y, t))

func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	if direction:
		velocity += direction * SPEED * delta
	
	velocity = lerp_vec2(velocity, Vector2(0, 0), 5.0*delta)

	move_and_slide()
