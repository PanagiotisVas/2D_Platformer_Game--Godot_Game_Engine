extends Area2D

signal collected

func _ready():
	# Start coin animation
	if $AnimatedSprite2D:
		$AnimatedSprite2D.play("idle")

func _on_body_entered(body):
	if body is CharacterBody2D:
		emit_signal("collected")
		queue_free()
