extends Interaction

export var haveEvent: bool = false
export var task_id: int
export var needEvent_number:int = 0
export var pickUp: bool = false
onready var collision_shape_2d = $CollisionShape2D


var followPlayer: bool = false
var holding: bool = false
var area_player = null
var posX: float
var posY: float


func _ready():
	posX = global_position.x
	posY = global_position.y

func _process(delta):
	action = Input.is_action_just_pressed("inspect")
	if action && canInspect && hud_textbox.get_child_count() == 0 and !holding:
		label.add_color_override("font_color", Color(1, 1, 1))
		label.visible = false
		if haveEvent:
			level.new_task(task_id)
		if pickUp and needEvent_number == Global.id_current_task:
			followPlayer = true
			holding = true
			area_player = interaction
		new_dialog()
	
	if followPlayer:
		
		posX = area_player.global_position.x
		posY = area_player.global_position.y
		global_position.x = posX
		global_position.y = posY - 22
		
		if Input.is_action_just_pressed("inspect") and holding and hud_textbox.get_child_count() == 0:
			# COLOCANDO O OBJETO NO CHAO
			# UP
			if Global.dir_player == 0:
				global_position.x = posX
				global_position.y = posY - 24
				
			# DOWN
			if Global.dir_player == 1:
				global_position.x = posX 
				global_position.y = posY + 68
				
			# LEFT
			if Global.dir_player == 2:
				global_position.x = posX - 36
				global_position.y = posY + 22
				
			# RIGHT
			if Global.dir_player == 3:
				global_position.x = posX + 24
				global_position.y = posY + 22
			followPlayer = false
			holding = false
			
			


func _on_Area_cutscene_less_size():
	collision_shape_2d.global_scale.y = 0.5
