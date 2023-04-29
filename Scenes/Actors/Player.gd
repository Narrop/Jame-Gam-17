extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	# Handle Reste
	if Input.is_action_just_pressed("level_reset"):
		get_tree().reload_current_scene()
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#
#	if direction < 0:
#		sprite.play("Walking")
#		sprite.flip_h = true
#	elif direction > 0:
#		sprite.play("Walking")
#		sprite.flip_h = false
#	elif is_on_floor() and direction == 0:
#		sprite.play("Idle")

	
	# Add the gravity.
	if is_on_floor():
		velocity.x = SPEED
		sprite.play("Walking")
		sprite.flip_h = false
	else:
		velocity.y += gravity * delta
		sprite.play("Jumping")
	
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Loose if falling
	if position.y >= 0:
		get_tree().reload_current_scene()
	
	move_and_slide()
