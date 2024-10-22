extends Interaction

export var id: int
export var task_id: int
export var vanish: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud_textbox.get_child_count() == 0:
		label.add_color_override("font_color", Color(1, 1, 1))
		label.visible = false
		Global.open_door(id)
		new_dialog()
		level.new_task(task_id)
		if vanish:
			queue_free()
		print(Global.keysGetted)
