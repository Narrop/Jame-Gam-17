extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu_music.play()


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


func _on_button_sound_pressed():
	if ($Button_sound.text in "Sound off"): 
		$Button_sound.text = "Sound on"
		$Menu_music.play();
	elif  ($Button_sound.text in "Sound on"): 	
		$Button_sound.text = "Sound off"
		$Menu_music.stop();
		
	
