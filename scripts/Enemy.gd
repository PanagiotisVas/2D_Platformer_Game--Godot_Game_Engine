extends CharacterBody2D

@export var speed := 60

var direction := -1
var is_dead := false

@onready var wall_check = $wall_check
@onready var edge_check = $edge_check


func _ready():
	$AnimatedSprite2D.play("default")


func _physics_process(_delta):
	if is_dead:
		velocity = Vector2.ZERO
		return

	var turned := false
	
	if wall_check.is_colliding():
		direction *= -1
		turned = true

	if not edge_check.is_colliding():
		direction *= -1
		turned = true
	
	if turned:
		wall_check.position.x = abs(wall_check.position.x) * direction
		edge_check.position.x = abs(edge_check.position.x) * direction

	velocity.x = speed * direction
	move_and_slide()

	$AnimatedSprite2D.flip_h = velocity.x < 0


func _on_player_kill_zone_body_entered(body):
	if is_dead:
		return

	if body is CharacterBody2D and body.has_method("die"):
		body.die()


func _on_head_zone_body_entered(body):
	if is_dead:
		return

	if body is CharacterBody2D:
		die()
		# small bounce for the player
		body.velocity.y = -300


func die():
	is_dead = true
	$AnimatedSprite2D.play("death")
	$AudioStreamPlayer2D.play()
	call_deferred("_remove_enemy")
	Global.enemies_defeated += 1


func _remove_enemy():
	await get_tree().create_timer(0.4).timeout
	queue_free()
