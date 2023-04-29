extends CharacterBody2D

const SPEED = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = SPEED
	var collision = move_and_collide(velocity * delta)
	if collision:
		get_tree().reload_current_scene()
