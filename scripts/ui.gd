extends CanvasLayer

@onready var pause_menu = $PauseMenu
@onready var help_menu = $HelpMenu
@onready var anim_player = $AnimationPlayer

func _ready():
	pause_menu.visible = false
	help_menu.visible = false


func _on_pause_button_pressed() -> void:
	$PauseMenu/StatsLabel.text = "Monsters Killed: " + str(Global.enemies_defeated)
	get_tree().paused = true
	pause_menu.visible = true
	anim_player.play("pause_open")


func _on_resume_button_pressed() -> void:
	anim_player.play("pause_close")
	await anim_player.animation_finished
	pause_menu.visible = false
	help_menu.visible = false
	get_tree().paused = false
	
	pause_menu.modulate.a = 1.0
	pause_menu.scale = Vector2(1, 1)


func _on_help_buttton_pressed() -> void:
	pause_menu.visible = false
	help_menu.visible = true
	anim_player.play("pause_open")


func _on_back_button_pressed() -> void:
	anim_player.play("pause_close")
	await anim_player.animation_finished
	help_menu.visible = false  
	pause_menu.visible = true
	anim_player.play("pause_open")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_music_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_sfx_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	
	
