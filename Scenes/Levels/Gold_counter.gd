extends Label


@onready var player_vars = get_node("/root/PlayerVariable")

func _process(_delta):
	text = "Gold : " + str(player_vars.coin)
