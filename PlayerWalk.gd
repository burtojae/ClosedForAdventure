extends KinematicBody2D

func _ready():
	#Puts the player near the fallen Goblin's meat.
	if Global.currentGoblin:
		self.position = $"..".get_node(Global.currentGoblin).position - Vector2(0, -20)


var speed = 350

func _fixed_process(delta):
	#Set movement direction.
	var direction = Vector2(0, 0).normalized()
	
	#Walk up.
	if Input.is_action_pressed("up"):
		direction.y -= 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("up")
	elif Input.is_action_just_released("up") and $playerAnimator.get_current_animation() == "up":
		$playerAnimator.stop() #Later this will instead set an idle
		$playerSprite.frame = 29 #animation to play

	#Walk down.
	if Input.is_action_pressed("down"):
		direction.y += 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("down")
	elif Input.is_action_just_released("down") and $playerAnimator.get_current_animation() == "down":
		$playerAnimator.stop()
		$playerSprite.frame = 4
	
	#Walk left
	if Input.is_action_pressed("left"):
		direction.x -= 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("left")
	elif Input.is_action_just_released("left") and $playerAnimator.get_current_animation() == "left":
		$playerAnimator.stop()
		$playerSprite.frame = 24
	
	#Walk right.
	if Input.is_action_pressed("right"):
		direction.x += 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("right")
	elif Input.is_action_just_released("right") and $playerAnimator.get_current_animation() == "right":
		$playerAnimator.stop()
		$playerSprite.frame = 12
		
	self.move_and_slide(direction * speed)
	$meatCount.set_text("Goblin Meat: " + str(Global.shittyMeatOwned))