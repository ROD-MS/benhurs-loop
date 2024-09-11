extends Node2D
class_name global

onready var task = $HUD_task/task


var keysGetted: Dictionary

func open_door(key):
	keysGetted[key] = false
	
func check_door(key):
	return keysGetted[key]

func new_door(id, isLocked):
	keysGetted[id] = isLocked

func new_task():
	task.new_task()
