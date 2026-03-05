extends CharacterBody2D

@export var ai: bool = false

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var direction: float

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 980 * delta

	if ai:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func death():
	print("DED")
	self.queue_free()
