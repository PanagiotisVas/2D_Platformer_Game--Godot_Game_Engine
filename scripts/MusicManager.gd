extends Node2D

func _ready():
	if not $AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.play()
