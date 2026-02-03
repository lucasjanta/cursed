extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var wall_impulse_timer : float = 0.3
var timer : float = 0.0
var dir : int = 0

func enter():
	player = get_parent().get_parent()
	state_machine = get_parent()
	player.velocity.y = player.jump_force / 1.5
	player.velocity.x = player.speed * dir
	timer = wall_impulse_timer
	update_animation(dir)
	
func physics_update(delta):
	if timer > 0.0:
		timer -= delta
	else:
		dir = Input.get_axis("left", "right")
		player.velocity.x = dir * player.speed
		
		
	if player.is_on_floor():
		state_machine.change_state(state_machine.get_node("IdleState"))
		
	if player.is_on_wall() and Input.is_action_just_pressed("jump"):
		player.velocity.y = player.jump_force / 1.5
		player.velocity.x = player.speed * (dir * -1)
		timer = wall_impulse_timer
		update_animation(dir * -1)
		
		


		
func update_animation(direction):
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	print(direction)
	animated_sprite_2d.play("crnr-jmp")
	
