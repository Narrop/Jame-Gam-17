extends Area2D

@onready var player = $AnimationPlayer

func _ready():
	player.connect("animation_finished", destroy)

func _physics_process(delta):
	
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			player.play('took')
		else:
			player.play('idle')
			
func destroy():
	if player.get_current_animation() == "took":
		queue_free()
