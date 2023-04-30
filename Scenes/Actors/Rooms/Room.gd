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
		else:
			$CollisionShape2D.set_collision_mask_bit(collision_mask, collision.collider.get_collision_layer(), false)
			collision = move_and_collide(velocity * delta)
			$CollisionShape2D.set_collision_mask_bit(collision_mask, collision.collider.get_collision_layer(), true)

func _on_player_entered():
	combat_mode = true
