extends StaticBody2D
class_name Interaction

# VARIABLES
var action = Input.is_action_just_pressed("inspect")
var interaction
var canInspect = false
export var text: Dictionary = {}

# NODES
onready var textbox = $textbox
const DIALOG = preload("res://scenes/textbox.tscn")
onready var hud = $"../HUD"
onready var label = $Label
onready var level = $".."


func new_dialog():
	var new_dialog = DIALOG.instance()
	new_dialog.text = text
	hud.add_child(new_dialog)

func _on_Area2D_area_entered(area):
	interaction = area
	canInspect = true
	label.visible = true

func _on_Area2D_area_exited(area):
	canInspect = false
	label.visible = false
