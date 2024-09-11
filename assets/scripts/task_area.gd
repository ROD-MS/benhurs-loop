extends Area2D

onready var level = $".."
export var eventNumber: int
onready var task = $"../HUD_task/task"

func _process(delta):
	if eventNumber == task.id:
		monitoring = true
	else:
		monitoring = false

func _on_task_area_body_entered(body):
	level.new_task()
	queue_free()
