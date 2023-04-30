extends Control

@export var game : Game

func _ready():
	hide()
	game.connect("toggle_game_paused", _on_game_paused)

func _on_game_paused(is_paused):
	if is_paused:
		show()
	else:
		hide()


func _on_resume_pressed():
	game.game_paused = false


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu/Menu.tscn")


func _on_restart_pressed():
	game.game_paused = false
	get_tree().reload_current_scene()
