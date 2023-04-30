extends StaticBody2D

signal isClosed

@onready var player = $AnimationPlayer

func _ready():
	player.connect("animation_finished", close)

func _on_trigger_player_entered():
	player.play('active')
	
func close(_p):
	if player.get_current_animation() == "active":
		player.play('closed')
		emit_signal("isClosed")
