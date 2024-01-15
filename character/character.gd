extends CharacterBody2D


var SPEED = 180
const DEF_SHORT_JUMP_VELOCITY = -200.0
const DEF_LONG_JUMP_VELOCITY = -400.0
var SHORT_JUMP_VELOCITY = DEF_SHORT_JUMP_VELOCITY
var LONG_JUMP_VELOCITY = DEF_LONG_JUMP_VELOCITY
var ROT_SPEED = 0

var won_timer = 0

var won = false
var inverted = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	won_timer = 0
	
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
		
	if Input.is_action_just_released("ui_accept") and !inverted:
		velocity.y += 100
		
	if Input.is_action_just_pressed("ui_accept") and is_on_ceiling():
		velocity.y = SHORT_JUMP_VELOCITY
		
	if Input.is_action_pressed("ui_accept") and is_on_ceiling():
		velocity.y = LONG_JUMP_VELOCITY
		
	if Input.is_action_just_released("ui_accept") and inverted:
		velocity.y -= 100
		
	if !is_on_floor() and !is_on_ceiling():
		ROT_SPEED = 180

	if is_on_floor():
		rotation = 0
		ROT_SPEED = 0
		
	if is_on_ceiling():
		rotation = 0
		ROT_SPEED = 0
	
	#velocity
	velocity.x = SPEED
	
	move_and_slide()
	
		

func set_def_pos():
	position.x = 0
	position.y = 5

func set_phys_normal():
	inverted = false
	rotation = 0
	ROT_SPEED = 0
	SHORT_JUMP_VELOCITY = DEF_SHORT_JUMP_VELOCITY
	LONG_JUMP_VELOCITY = DEF_LONG_JUMP_VELOCITY
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
func set_phys_inverted():
	inverted = true
	rotation = 0
	ROT_SPEED = 0
	SHORT_JUMP_VELOCITY = -1 * DEF_SHORT_JUMP_VELOCITY
	LONG_JUMP_VELOCITY = -1 * DEF_LONG_JUMP_VELOCITY
	gravity = -1 * ProjectSettings.get_setting("physics/2d/default_gravity")

func on_win(delta):
	position.y -= 25 * delta
	position.x += 45 * delta
	ROT_SPEED = 720
	set_physics_process(false)
	if won_timer > 5000 * delta:
		get_tree().change_scene_to_file("res://levels/select_level.tscn")
	won_timer += 30 * delta
	
	
	
