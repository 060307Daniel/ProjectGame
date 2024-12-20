extends KinematicBody2D  # Pastikan node ini adalah KinematicBody2D

var speed = 50
var motion = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("sidewalk")
		$AnimatedSprite.flip_h = true
		motion.x = speed
		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("sidewalk")
		$AnimatedSprite.flip_h = false
		motion.x = -speed
		motion.y = 0
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("downwalk")
		motion.y = speed
		motion.x = 0
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite.play("upwalk")
		motion.y = -speed
		motion.x = 0
	else:
		$AnimatedSprite.play("idle")
		motion = Vector2.ZERO

	# Gerakkan karakter
	motion = move_and_slide(motion)

func player_sell_method():
	pass
func player_shop_method():
	pass
