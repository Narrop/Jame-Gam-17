extends Label

@onready var player_vars = get_node("/root/PlayerVariable")

func _on_timer_timeout():
	player_vars.score += 1
	text = "Score: " + str(player_vars.score) # met à jour le texte de l'étiquette avec le score
