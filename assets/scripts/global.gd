extends Node2D

var keysGetted: Array = [true, false]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func open_door(key):
	keysGetted.remove(key)
	keysGetted.insert(key, true)
	
func check_door(key):
	var isLocked = !keysGetted[key]
	return isLocked
