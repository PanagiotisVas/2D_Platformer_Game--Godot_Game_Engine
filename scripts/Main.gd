extends Node2D

var score := 0


func _ready():
	# Connect collectible signals
	for c in get_tree().get_nodes_in_group("coins"):
		if c.has_signal("collected"):
			c.collected.connect(_on_collectible_collected)


func _on_collectible_collected():
	score += 1
	$UI/HUD/ScoreLabel.text = "Coins: %d" % score


func _on_death_zone_body_entered(body):
	if body is CharacterBody2D and body.has_method("die"):
		body.die()
