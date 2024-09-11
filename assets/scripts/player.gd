extends KinematicBody2D

#CONSTANTES E VARIAVEIS
const SPEED = 300
var inspect = 0
var dirX = 0
var dirY = 0
var velX = 0
var velY = 0
var dir = 0
onready var hud_textbox = $"../HUD_textbox"

onready var animation = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("idle_down")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moviments_actions()
	sprites_animation()
	
	
	# PARANDO O PLAYER QUANDO ESTIVER EM UM DIÁLOGO
	if hud_textbox.get_child_count() == 1:
		velX = 0
		velY = 0

	move_and_slide(Vector2(velX, velY))
	
	
func moviments_actions():
	# BOTÕES
	dirX = Input.get_axis("left", "right")
	dirY = Input.get_axis("up", "down")
	inspect = Input.is_action_just_pressed("ui_accept")
	
	# ATRIBUINDO A VELOCIDADE
	velX = dirX * SPEED
	velY = dirY * SPEED


func sprites_animation():
	
	# IDLE
	if velX == 0 and velY == 0:
		if dir == 1:
			animation.play("idle_down")
		if dir == 2:
			animation.flip_h = true
			animation.play("idle_left_right")
		if dir == 3:
			animation.flip_h = false
			animation.play("idle_left_right")
		
	# WALK DOWN
	if velY > 0:
		dir = 1
		animation.play("walk_down")
		
	# WALK UP
	if velY < 0:
		dir =  0
		
	# WALK LEFT
	if velX < 0:
		dir = 2
		
	# WALK RIGHT
	if velX > 0:
		dir = 3
