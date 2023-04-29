extends Label

var score = 0
@onready var timer = $Timer

func _ready():
	# configure le timer pour appeler la fonction increment_score toutes les secondes
	$Timer.start()


func increment_score():
	score += 1
	var score_label = get_node("Score")
	score_label.set_text("Score: " + str(score)) # met à jour le texte de l'étiquette avec le score
