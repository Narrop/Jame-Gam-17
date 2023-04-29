extends CharacterBody2D

@export_enum("Runner", "Fighter") var state = 0

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
	
	# If we are in runner mode, player runs in auto and can only jump
	if state == 0:
		if is_on_floor():
			velocity.x = SPEED
			sprite.play("Walking")
			sprite.flip_h = false
	else:
		# In fight mode, player can be controlled in every direction
		var direction = Input.get_axis("ui_left", "ui_right")

		if direction < 0:
			sprite.play("Walking")
			sprite.flip_h = true
		elif direction > 0:
			sprite.play("Walking")
			sprite.flip_h = false
		elif is_on_floor() and direction == 0:
			sprite.play("Idle")
			
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Jumping works on every state
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite.play("Jumping")	

	# Loose if falling
	if position.y >= 0:
		get_tree().reload_current_scene()
	
	move_and_slide()
