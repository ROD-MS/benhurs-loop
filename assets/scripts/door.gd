extends Interaction

export var id: int = 0
export var isLocked: bool = false
export var haveEvent: bool = false
export var right_side: bool = false
export var task_id: int

onready var collision = $CollisionShape2D
onready var area2d_collision = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("close")
	Global.new_door(id, isLocked)
	label.text = ""
	animation.flip_h = right_side

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud_textbox.get_child_count() == 0:
		isLocked = Global.check_door(id)
		if isLocked:
			new_dialog()
		else:
			if haveEvent:
				Global.new_task(task_id)
			open_door()
		print(Global.keysGetted)
		
		
func open_door():
	animation.play("open")
	if right_side:
		animation.position.x = 6 * 1
	else:
		animation.position.x = 6 * -1
	animation.position.y = -16
	collision.queue_free()
	area2d_collision.queue_free()
