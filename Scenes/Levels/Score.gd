extends Label

var score = 0
var timer = Timer.new()

func _ready():
	# configure le timer pour appeler la fonction increment_score toutes les secondes
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "increment_score")
	timer.start()

func increment_score():
	score += 1
	var score_label = get_node("Score")
	score_label.set_text("Score: " + str(score)) # met à jour le texte de l'étiquette avec le score
