extends Label

var score = 0


func _ready():
	# configure le timer pour appeler la fonction increment_score toutes les secondes
	pass


func increment_score():
	PlayerVariable.score += 1
	var score_label = get_node("Score")
	score_label.set_text("Score: " + str(PlayerVariable.score)) # met à jour le texte de l'étiquette avec le score
