extends CharacterBody2D

@export var ai: bool = false

const accel = 4000.0
const JUMP_VELOCITY = -600.0

var direction: float

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 980 * delta

	if !ai:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		direction = Input.get_axis("move_left", "move_right")

		if Input.is_action_just_pressed("attack"):
			$ATTACKBOX.attack_start()
	if is_on_floor():
		if direction:
			velocity.x += direction * accel * delta
		velocity.x = lerp(velocity.x, 0.0, clamp(10.0*delta, 0, 1))
	else:
		if direction:
			velocity.x += direction * accel/5 * delta
			velocity.x = lerp(velocity.x, 0.0, clamp(2.0*delta, 0, 1))

	if velocity.x != 0:
		$ATTACKBOX.attack_dir = clamp(velocity.x * 1000000000000000, -1, 1)

	move_and_slide()

func death():
	print("DED")
	self.queue_free()
