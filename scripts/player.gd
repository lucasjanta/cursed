extends CharacterBody2D


@export var speed = 200.0
@export var jump_force = -400.0
@export var gravity_force : float = 900.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity_force * delta

	move_and_slide()
