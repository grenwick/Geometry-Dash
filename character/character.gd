extends CharacterBody2D


var SPEED = 180
var SHORT_JUMP_VELOCITY = -200.0
var LONG_JUMP_VELOCITY = -400.0
var ROT_SPEED = 0
var won = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	rotation_degrees += ROT_SPEED * delta
	
	if won:
		on_win(delta)
	

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = SHORT_JUMP_VELOCITY
		
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = LONG_JUMP_VELOCITY
		
	if Input.is_action_just_released("ui_accept"):
		velocity.y += 100
		
	if !is_on_floor():
		ROT_SPEED = 180

	if is_on_floor():
		rotation = 0
		ROT_SPEED = 0
	
	#velocity
	velocity.x = SPEED
	
	move_and_slide()
	
		


func on_win(delta):
	position.y -= 25 * delta
	position.x += 45 * delta
	ROT_SPEED = 720
	set_physics_process(false)
	
	
	
	
