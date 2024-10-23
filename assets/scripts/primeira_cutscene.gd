extends Node2D

onready var animation = $transition/AnimationPlayer

func _ready():
	animation.play("cutscene_1")
