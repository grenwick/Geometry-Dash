extends StaticBody2D





func _on_area_2d_body_entered(body):
	if is_instance_of(body, CharacterBody2D):
		body.set_def_pos()
		body.set_phys_normal()
	
