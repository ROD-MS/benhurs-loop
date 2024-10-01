extends CanvasLayer

onready var animation = $AnimationPlayer
var next_scene

func fade_into(scene):
	next_scene = scene
	animation.play("Fade")
	
	
func change_scene():
	get_tree().change_scene(next_scene)
