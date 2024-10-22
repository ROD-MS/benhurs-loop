extends Area2D

export var next_room = ""
export var eventNumber: int
onready var task = $"../HUD_task/task"

func _process(delta):
	if eventNumber == task.id or eventNumber == 0:
		monitoring = true
	else:
		monitoring = false

func _on_transition_area_body_entered(body):
	Transition.fade_into(next_room)
