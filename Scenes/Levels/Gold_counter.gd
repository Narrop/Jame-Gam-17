extends Label

var gold = 0 

func set_gold(value):
		gold = value
		var gold_label = get_node("Gold_counter")
		text = "Gold : " + str(gold) # met à
	
func _process(delta):
	set_gold(gold);
