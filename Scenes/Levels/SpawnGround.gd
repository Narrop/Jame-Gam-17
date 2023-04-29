extends Node2D

const GROUNDWIDTH = 3 * 128

@onready var spawn_position = get_parent().global_position
@onready var player = get_parent().get_node("Player")

var rng = RandomNumberGenerator.new()
var scenesList = [
	preload("res://Scenes/Levels/Grounds/Ground1.tscn"),
	preload("res://Scenes/Levels/Grounds/Ground2.tscn"),
	preload("res://Scenes/Levels/Grounds/Ground3.tscn"),
	preload("res://Scenes/Levels/Grounds/Ground4.tscn")
]	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if spawn_position.distance_to(player.global_position) < 1000:
		spawn_ground()

	
func spawn_ground():
	# Randomly choose a ground type and instanciante it
	var random_ground = scenesList[rng.randi_range(0, scenesList.size() - 1)]
	var spawn_ground_instance = random_ground.instantiate()
	add_child(spawn_ground_instance)
	spawn_ground_instance.position.x = spawn_position.x
	#spawn_ground_instance.position.x = spawn_position.x
	spawn_position.x = spawn_position.x + GROUNDWIDTH
