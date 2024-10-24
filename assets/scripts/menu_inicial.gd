extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("inspect"):
		Transition.fade_into("res://scenes/primeira_cutscene.tscn")

