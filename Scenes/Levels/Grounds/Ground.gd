extends Sprite2D

@onready var player = get_parent().get_parent().get_node("Player")

func _ready():
	pass


func _process(delta):
	# Delete the hidden ground
	if global_position.distance_to(player.global_position) > 1000 and player.global_position.x > global_position.x:
		queue_free()
	pass
