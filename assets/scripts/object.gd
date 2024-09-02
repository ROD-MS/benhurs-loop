extends Interaction

func _process(delta):
	action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud.get_child_count() == 0:
		label.add_color_override("font_color", Color(1, 1, 1))
		label.visible = false
		new_dialog()
