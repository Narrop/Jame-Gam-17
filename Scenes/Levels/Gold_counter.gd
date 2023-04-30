extends Label


@onready var player_vars = get_node("/root/PlayerVariable")
var gold = 0

func _process(delta):
	#set_gold(gold);
	var gold_label = get_node("Gold_counter")
	text = "Gold : " + str(player_vars.coin) # met à
