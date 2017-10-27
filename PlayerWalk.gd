extends KinematicBody2D

func _ready():
	#Puts the player near the fallen Goblin's meat.
	if Global.currentGoblin:
		self.position = $"..".get_node(Global.currentGoblin).position - Vector2(0, -20)


var speed = 350

func _fixed_process(delta):
	var direction = Vector2(0, 0)
	
	if Input.is_action_pressed("up"):
		direction.y -= 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("up")
	if Input.is_action_pressed("down"):
		direction.y += 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("down")
	if Input.is_action_pressed("left"):
		direction.x -= 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("left")
	if Input.is_action_pressed("right"):
		direction.x += 1
		if $playerAnimator.is_playing() == false:
			$playerAnimator.play("right")
		
	self.move_and_slide(direction * speed)
	$meatCount.set_text("Goblin Meat: " + str(Global.shittyMeatOwned))