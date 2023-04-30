extends Area2D

signal PlayerEntered

func _ready():
	var player = get_parent().get_parent().find_child("Player")
	self.connect("PlayerEntered", Callable(player, "_on_player_entered"))
	
	var room = get_parent().get_parent().find_child("*room")
	self.connect("PlayerEntered", Callable(player, "_on_player_entered"))
		

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			print("triggered")
			emit_signal("PlayerEntered")
			queue_free()
