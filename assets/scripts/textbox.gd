extends Node2D

onready var sprite = $Sprite
onready var label = $Label
var canInspect = false
var id = 1

export var text: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = text[id]
#	print(text.size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var action = Input.is_action_just_pressed("inspect")
	if action:
		if label.get_visible_characters() != label.get_total_character_count():
			label.visible_characters = label.get_total_character_count()
		elif id < text.size():
			id += 1
			label.text = text[id]
			label.percent_visible = 0
		else:
			queue_free()
#		print(id)

func _on_Timer_timeout():
	if label.get_visible_characters() != label.get_total_character_count():
		label.visible_characters += 1

