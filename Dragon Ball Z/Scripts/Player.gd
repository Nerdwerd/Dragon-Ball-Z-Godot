extends KinematicBody2D

#Variables
export var pspeed = 400
export var gravity = 2
export var pjump = 200
var motion = Vector2()
const GROUND = Vector2(0,-1)

func _ready():
	pass 

func _process(delta):
	motion.y += 2
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		motion.y = pjump
	elif Input.is_action_pressed("ui_left"):
		motion.x = -pspeed
	elif Input.is_action_pressed("ui_right"):
		motion.x = pspeed
	else:
		motion.x = 0

	motion = move_and_slide(motion, GROUND)
