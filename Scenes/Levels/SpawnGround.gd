extends Node2D

const GROUNDWIDTH = 3 * 128

@onready var spawn_position = get_parent().global_position
@onready var player = get_parent().get_node("Player")

var first = true

var rng = RandomNumberGenerator.new()
var scenesList = [
	preload("res://Scenes/Levels/Grounds/Ground1.tscn"),
	preload("res://Scenes/Levels/Grounds/Ground2.tscn"),
	preload("res://Scenes/Levels/Grounds/Ground3.tscn"),
	preload("res://Scenes/Levels/Grounds/Ground4.tscn"),
	preload("res://Scenes/Levels/Grounds/Ground5.tscn")
]	

var coin = preload("res://Scenes/Levels/Coin.tscn")
var hammer = preload("res://Scenes/Levels/Hammer.tscn")
var arena = preload("res://Scenes/Levels/Arenas/Arena.tscn")

var arena_spawned = false

func _process(_delta):
	if not arena_spawned:
		if PlayerVariable.hammers == 3:
			spawn_arena()
		else:
			if spawn_position.distance_to(player.global_position) < 1000:
				spawn_ground()
	
func spawn_ground():
	# Randomly choose a ground type and instanciante it
	var random_ground
	if first:
		random_ground = scenesList[0]
		first = false
	else:
		random_ground = scenesList[rng.randi_range(0, scenesList.size() - 1)]
		
	var spawn_ground_instance = random_ground.instantiate()
	add_child(spawn_ground_instance)
	spawn_ground_instance.position.x = spawn_position.x
	
	# Spawn a coin if you get lucky
	if rng.randf() > .5:
		var coin_instance = coin.instantiate()
		spawn_ground_instance.add_child(coin_instance)
	else:
		# Spawn a hammer if you are very
		if rng.randf() > .7:
			var hammer_instance = hammer.instantiate()
			spawn_ground_instance.add_child(hammer_instance)
	
	# Increment spawn position for the next one
	spawn_position.x += GROUNDWIDTH

func spawn_arena():
	var spawn_arena_instance = arena.instantiate()
	get_parent().add_child(spawn_arena_instance)
	spawn_position.x += GROUNDWIDTH
	spawn_arena_instance.position.x = spawn_position.x
	arena_spawned = true
