extends Node

var coin = 0
var score = 0
var hammers = 0
var max_score = 0

func reset():
	score = 0
	hammers = 0
	
	# charge le score maximal à partir du localStorage
	if Engine.has_singleton("Web"):
		var local_storage = Engine.get_singleton("Web").local_storage
		if local_storage.has_feature("localStorage"):
			max_score = int(local_storage.get_item("max_score"))
