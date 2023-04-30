extends CharacterBody2D

const SPEED = 300

var combat_mode = false

@onready var h_diff = global_position.y - get_parent().get_node("Player").global_position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not combat_mode:
		velocity.x = SPEED
		var collision = move_and_collide(velocity * delta)
		if collision and collision.get_collider().name == "Player":
			get_tree().reload_current_scene()
	global_position.y = get_parent().get_node("Player").global_position.y + h_diff

func _on_player_entered():
	combat_mode = true


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
