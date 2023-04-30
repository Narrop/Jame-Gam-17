extends Label

@onready var player_vars = get_node("/root/PlayerVariable")



func _ready():
	text = "Score: " + str(player_vars.score) + "\nMax score: " + str(player_vars.max_score)

func _on_timer_timeout():
	player_vars.score += 1
	
	
	if player_vars.score > player_vars.max_score:
		player_vars.max_score = player_vars.score
		# enregistre le score maximal dans le localStorage
		if Engine.has_singleton("Web"):
			var local_storage = Engine.get_singleton("Web").local_storage
			if local_storage.has_feature("localStorage"):
				local_storage.set_item("max_score", str(player_vars.max_score))
	
	# met à jour le texte de l'étiquette avec le score
	text = "Score: " + str(player_vars.score) + "\nMax score: " + str(player_vars.max_score)
