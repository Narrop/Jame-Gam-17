extends CharacterBody2D

const SPEED = 300

var combat_mode = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not combat_mode:
		velocity.x = SPEED
		var collision = move_and_collide(velocity * delta)
		if collision and collision.get_collider().name == "Player":
			get_tree().reload_current_scene()

func _on_player_entered():
	combat_mode = true
