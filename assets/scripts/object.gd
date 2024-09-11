extends Interaction

export var haveEvent: bool = false

func _process(delta):
	action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud_textbox.get_child_count() == 0:
		label.add_color_override("font_color", Color(1, 1, 1))
		label.visible = false
		if haveEvent:
			level.new_task()
		new_dialog()
