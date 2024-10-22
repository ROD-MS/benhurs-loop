extends Area2D

onready var level = $".."
export var eventNumber: int
export var task_id: int = 1
onready var task = $"../HUD_task/task"

func _process(delta):
	if eventNumber == task.id:
		monitoring = true
	else:
		monitoring = false

func _on_task_area_body_entered(body):
	level.new_task(task_id)
	queue_free()
