extends KinematicBody2D

#Variables
export var pspeed = 400
export var gravity = 50
export var pjump = -1000
var motion = Vector2()
var GROUND = Vector2(0,-1)
var movement = true;

func _ready():
	pass 

func _process(delta):
	_Input()

func _Input():
	motion.y += gravity
	if is_on_floor() && Input.is_action_pressed("ui_up") && movement == true:
		motion.y = pjump 
		$AnimatedSprite.set_animation("Jump")
	elif Input.is_action_pressed("ui_left") && movement == true:
		motion.x = -pspeed
		if is_on_floor():
			if $AnimatedSprite.flip_h == true:
				$AnimatedSprite.set_animation("DashForward")
			elif Input.is_action_pressed("ui_focus_next") && $AnimatedSprite.flip_h == false:
				$AnimatedSprite.set_animation("DashBack")
			else:
				$AnimatedSprite.set_flip_h(true) 
	elif Input.is_action_pressed("ui_right") && movement == true:
		motion.x = pspeed
		if is_on_floor():
			if $AnimatedSprite.flip_h == false:
				$AnimatedSprite.set_animation("DashForward")
			elif Input.is_action_pressed("ui_focus_next") && $AnimatedSprite.flip_h == true:
				$AnimatedSprite.set_animation("DashBack")
			else:
				$AnimatedSprite.set_flip_h(false) 
	elif movement == true:
		motion.x = 0
		if is_on_floor():
			motion.y = 0
			$AnimatedSprite.set_animation("Idle")
	motion = move_and_slide(motion, GROUND)