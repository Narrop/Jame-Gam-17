extends Node2D

const GROUNDSPAWNER = preload("res://Scenes/Levels/Grounds/Ground.tscn")
const GROUNDWIDTH = 128

var spawn_position = global_position
@onready var player = get_parent().get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(spawn_position)
	print(spawn_position.distance_to(player.global_position))
	print('----------------------')
	if spawn_position.distance_to(player.global_position) < 1000:
			spawn_ground()
	pass
	
func spawn_ground():
	var spawn_ground_instance = GROUNDSPAWNER.instantiate()
	add_child(spawn_ground_instance)
	print(spawn_position)
	spawn_ground_instance.global_position.x = spawn_position.x
	spawn_position.x += GROUNDWIDTH
