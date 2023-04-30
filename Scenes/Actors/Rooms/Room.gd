extends CharacterBody2D

const SPEED = 300

var combat_mode = false

var h_diff: int = -164



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if global_position.y - get_parent().get_node("Player").global_position.y > h_diff + 10:
		velocity.y = -100
	elif global_position.y - get_parent().get_node("Player").global_position.y < h_diff - 10:
		velocity.y = 100
	else:
		velocity.y  = 0
	
	if not combat_mode:
		velocity.x = SPEED
		var collision = move_and_collide(velocity * delta)
		if collision and collision.get_collider().name == "Player":
			get_tree().reload_current_scene()


func _on_player_entered():
	combat_mode = true


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
