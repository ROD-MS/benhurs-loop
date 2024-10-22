extends Area2D

signal less_size

const CHAIR = preload("res://scenes/objects/kitchen/cadeira.tscn")
export var text_cut: Dictionary
onready var level = $".."
onready var geladeira = $".."


func _on_Area_cutscene_area_entered(area):
	if area.is_in_group("object_area"):
		area.get_parent().queue_free()
		var chair = CHAIR.instance()
		get_parent().add_child(chair)
		chair.scale.x = 2
		chair.scale.y = 2
		chair.global_position.x = global_position.x
		chair.global_position.y = global_position.y + 32
		var collision_chair = chair.get_child(3)
		collision_chair.queue_free()
		emit_signal("less_size")
		
		geladeira.text = text_cut
		Global.open_door(1)
