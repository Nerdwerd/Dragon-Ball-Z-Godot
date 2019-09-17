extends KinematicBody2D

#Variables
export var pspeed = 400
export var gravity = 100
export var pjump = -2000
var motion = Vector2()
var GROUND = Vector2(0,-1)

func _ready():
	pass 

func _process(delta):
	motion.y += gravity
	if is_on_floor() && Input.is_action_pressed("ui_up"):
		motion.y = pjump
		$AnimatedSprite.set_animation("Jump")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -pspeed
		if is_on_floor():
			$AnimatedSprite.set_animation("DashBack")
	elif Input.is_action_pressed("ui_right"):
		motion.x = pspeed
		if is_on_floor():
			$AnimatedSprite.set_animation("DashForward")	
	else:
		motion.x = 0
		if is_on_floor():
			motion.y = 0
			$AnimatedSprite.set_animation("Idle")

	motion = move_and_slide(motion, GROUND)
