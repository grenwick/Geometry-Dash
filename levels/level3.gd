extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player.position.y > 400 or $Player.position.y < -600 :
		$Player.set_phys_normal()
		$Player.set_def_pos()
