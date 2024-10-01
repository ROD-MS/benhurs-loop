extends Area2D

export var next_room = ""

func _on_transition_area_body_entered(body):
	Transition.fade_into(next_room)
