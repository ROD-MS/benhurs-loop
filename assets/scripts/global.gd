extends Node2D
class_name global

onready var task = $HUD_task/task
onready var player = $player
var id_current_task: int
var dir_player: int

var keysGetted: Dictionary

func _process(delta):
	if has_node("player"):
		dir_player = player.dir

func open_door(key):
	keysGetted[key] = false
	
func check_door(key):
	return keysGetted[key]

func new_door(id, isLocked):
	keysGetted[id] = isLocked

func new_task(task_id):
	task.new_task(task_id)
