extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var error = get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")
	if (error != OK):
		print('don\'t work');


func _on_button_crdit_pressed():
	var error = get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")
	if (error != OK):
		print('don\'t work');
