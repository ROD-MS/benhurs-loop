extends Node2D

export var task: Dictionary
var id = 1
onready var label = $Label

func _ready():
	visible = true
	label.text = task[id]

func _on_Timer_timeout():
	if label.get_visible_characters() != label.get_total_character_count():
		label.visible_characters += 1

func new_task(task_id):
	id = task_id
	Global.id_current_task = id
	label.text = task[id]
	label.percent_visible = 0



