extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(body):
	if is_instance_of(body, CharacterBody2D):
		body.set_def_pos()
		body.set_phys_normal()
	
