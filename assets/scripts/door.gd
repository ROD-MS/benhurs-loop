extends Interaction

export var id: int = 0
export var isLocked: bool = false
export var haveEvent: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	level.new_door(id, isLocked)
	label.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud_textbox.get_child_count() == 0:
		isLocked = level.check_door(id)
		if isLocked:
			new_dialog()
		else:
			if haveEvent:
				level.new_task()
			queue_free()
		print(level.keysGetted)
