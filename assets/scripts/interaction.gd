extends StaticBody2D

var interaction
var canInspect = false
export var text: Dictionary = {}
export var isKey: bool = false
export var idKey: int = 0
export var isDoor: bool = false
export var isLocked: bool = false
onready var textbox = $textbox
const DIALOG = preload("res://scenes/textbox.tscn")
onready var hud = $"../HUD"
onready var label = $Label
onready var level = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud.get_child_count() == 0:
		if !isDoor and !isKey:
			new_dialog()
		label.add_color_override("font_color", Color(1, 1, 1))
		label.visible = false
		
		if isKey:
			level.open_door(idKey)
			new_dialog()
			queue_free()
			
			
		if isDoor:
			isLocked = level.check_door(idKey)
			if isLocked:
				new_dialog()
			else:
				queue_free()


func new_dialog():
	var new_dialog = DIALOG.instance()
	new_dialog.text = text
	hud.add_child(new_dialog)


func _on_Area2D_area_entered(area):
	interaction = area
	canInspect = true
	if !isDoor:
		label.visible = true

func _on_Area2D_area_exited(area):
	canInspect = false
	label.visible = false
