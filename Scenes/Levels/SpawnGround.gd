extends Node2D

const GROUNDWIDTH = 128

@onready var spawn_position = get_parent().global_position
@onready var player = get_parent().get_node("Player")

var rng = RandomNumberGenerator.new()
var scenesList = []

func _ready():
	print(spawn_position)
	# Load every type of ground
	var path = "res://Scenes/Levels/Grounds/"
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var files = dir.get_files()
		for i in range(0, files.size()):
			if files[i].get_extension() == 'tscn':
				scenesList.append(load(path + files[i]))		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if spawn_position.distance_to(player.global_position) < 1000:
		spawn_ground()

	
func spawn_ground():
	
	# Randomly put a hole in the ground
	if rng.randf() > 0.7:
		spawn_position.x += GROUNDWIDTH
		return
	
	# Randomly choose a ground type and instanciante it
	var random_ground = scenesList[rng.randi_range(0, scenesList.size() - 1)]
	var spawn_ground_instance = random_ground.instantiate()
	add_child(spawn_ground_instance)
	spawn_ground_instance.global_position.x = spawn_position.x
	spawn_position.x = spawn_position.x + GROUNDWIDTH
