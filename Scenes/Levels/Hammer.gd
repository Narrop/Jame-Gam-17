extends Area2D

@onready var player = $AnimationPlayer


func _ready():
	player.connect("animation_finished", destroy)

func _physics_process(_delta):
	
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			player.play('took')
			PlayerVariable.hammers += 1
		else:
			player.play('idle')
			
func destroy(_p):
	if player.get_current_animation() == "took":
		queue_free()
