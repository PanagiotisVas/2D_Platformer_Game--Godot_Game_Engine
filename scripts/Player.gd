extends CharacterBody2D

@export var speed: int = 160
@export var jump_velocity: int = 500
@export var gravity: int = 1000
@export var death_delay := 1
@export var max_jumps := 2

var is_dead := false
var jump_count := 0


func _physics_process(delta):
	# If player is dead, freeze movement
	if is_dead:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	# Gravity
	velocity.y += gravity * delta

	# Horizontal movement
	var input_dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * speed

	# Reset jumps when touching ground
	if is_on_floor():
		jump_count = 0

	# Jump (allows double jump)
	if Input.is_action_just_pressed("ui_up") and jump_count < max_jumps:
		velocity.y = -jump_velocity
		jump_count += 1

	# Flip sprite
	if input_dir != 0:
		$AnimatedSprite2D.flip_h = input_dir < 0

	# Animation state handling
	if not is_on_floor():
		if velocity.y < 0:
			play_anim("jump")
		else:
			play_anim("fall")
	elif input_dir != 0:
		play_anim("run")
	else:
		play_anim("idle")

	move_and_slide()


func die():
	if is_dead:
		return

	is_dead = true
	velocity = Vector2.ZERO
	play_anim("death")
	$AudioStreamPlayer2D.play()
	call_deferred("_delayed_reload")


func _delayed_reload():
	await get_tree().create_timer(death_delay).timeout
	get_tree().reload_current_scene()


func play_anim(anim_name: String) -> void:
	if $AnimatedSprite2D.animation != anim_name:
		$AnimatedSprite2D.play(anim_name)
