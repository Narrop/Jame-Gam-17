extends Node2D

const section_time = 2.0
const line_time = 0.3
const base_speed = 100
const speed_up_multiplier = 10.0

var scroll_speed = base_speed
var speed_up = false

@onready var line = $CreditsContainer/Line
var started = false

var section
var section_next = true
var section_timer = 0.0
var line_timer = 0.0
var curr_line = 0
var lines = []

var credits = [
	[
		"A game by FOO"
	],
	[
		"Programming",
		"Marie",
		"Badr",
		"Rémi"
	],
	[
		"Art",
		"Badr",
		"Marie",
		"Stolen from the internet"
	],[
		"Music",
		"Marie",
		"Stolen from the internet"
	],
	[
		"Tools used",
		"Developed with Godot Engine 4",
		"https://godotengine.org/license",
		"",
		"Art created with ???",
		"link"
	], [
		"Special thanks",
		"Le A"
	]
]

func _process(delta):
	scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
			
	if speed_up:
		scroll_speed *= speed_up_multiplier
		
	if lines.size() > 0:
		for l in lines:
			l.position.y -= scroll_speed
			if l.position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()
		
func finish():
	get_tree().change_scene_to_file("res://Scenes/menu/Menu.tscn")
		
func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	new_line.visible = true
	lines.append(new_line)
	if curr_line == 0:
		# Put the title in another color
		var settings = new_line.label_settings.duplicate()
		settings.font_color = Color.BLUE_VIOLET
		new_line.label_settings = settings
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true
		
func _unhandled_input(event):
	if event.is_action_pressed('ui_cancel'):
		finish()
	elif event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	elif event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
