extends Interaction

export var id: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud.get_child_count() == 0:
		label.add_color_override("font_color", Color(1, 1, 1))
		label.visible = false
		level.open_door(id)
		new_dialog()
		queue_free()
		print(level.keysGetted)
