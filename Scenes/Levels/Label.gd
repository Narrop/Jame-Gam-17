extends Label

var score = 0

func _on_timer_timeout():
	score += 1
	var score_label = get_node("Score")
	text = "Score: " + str(score) # met à jour le texte de l'étiquette avec le score
