extends Node

func _process(delta):
	if $"../ShittyGoblin".health <= 0:
		$overworld.visible = true
		$overworld.disabled = false
	elif $"../Player".health <= 0:
		$restart.visible = true
		$restart.disabled = false

#Attack selected.
func attackPressed():
	$attack.visible = false
	$attack.disabled = true
	
	$head.visible = true
	$head.disabled = false
	
	$legs.visible = true
	$legs.disabled = false
	
	$arms.visible = true
	$arms.disabled = false
	
	$chest.visible = true
	$chest.disabled = false
	
func attackReset():
	$attack.visible = true
	$attack.disabled = false
	
	$head.visible = false
	$head.disabled = true
	
	$legs.visible = false
	$legs.disabled = true
	
	$arms.visible = false
	$arms.disabled = true
	
	$chest.visible = false
	$chest.disabled = true

func enemyAttack():
	randomize()
	
	var attackChoice = randi() % 5 + 1
	
	if attackChoice == 1:
		$"../ShittyGoblin".attackHead()
	elif attackChoice == 2:
		$"../ShittyGoblin".attackArms()
	elif attackChoice == 3:
		$"../ShittyGoblin".attackFeet()
	else:
		$"../ShittyGoblin".attackBody()

#Choosing part.
func headHover():
	$"../ShittyGoblin/shitHead".visible = true


func legsHover():
	$"../ShittyGoblin/shitFeet".visible = true


func armsHover():
	$"../ShittyGoblin/shitArms".visible = true


func chestHover():
	$"../ShittyGoblin/shitBody".visible = true


func headUnHover():
	$"../ShittyGoblin/shitHead".visible = false


func legsUnHover():
	$"../ShittyGoblin/shitFeet".visible = false


func armsUnHover():
	$"../ShittyGoblin/shitArms".visible = false


func chestUnHover():
	$"../ShittyGoblin/shitBody".visible = false


func headSelect():
	#If no one has died you can attack.
	if $"../Player".health > 0 and $"../ShittyGoblin".health > 0:
		#Attack order is based on speed.
		if $"../ShittyGoblin".speed < $"../Player".speed:
			$"../ShittyGoblin".health -= 2 * $"../Player".strength
			#If you attack first and your opponent dies, they
			#don't get to attack, and vice-versa.
			if $"../ShittyGoblin".health > 0:
				enemyAttack()
		elif $"../ShittyGoblin".speed >= $"../Player".speed:
			enemyAttack()
			if $"../Player".health > 0:
				$"../ShittyGoblin".health -= 2 * $"../Player".strength
				
	headUnHover()
	attackReset()

func legsSelect():
	if $"../Player".health > 0 and $"../ShittyGoblin".health > 0:
		if $"../ShittyGoblin".speed < $"../Player".speed:
			$"../ShittyGoblin".health -= 2 * $"../Player".strength
			#Attacking legs reduces speed.
			$"../ShittyGoblin".speed -= 2
			if $"../ShittyGoblin".health > 0:
				enemyAttack()
		elif $"../ShittyGoblin".speed >= $"../Player".speed:
			enemyAttack()
			if $"../Player".health > 0:
				$"../ShittyGoblin".health -= 2 * $"../Player".strength
				$"../ShittyGoblin".speed -= 2
	legsUnHover()
	attackReset()

func armsSelect():
	if $"../Player".health > 0 and $"../ShittyGoblin".health > 0:
		if $"../ShittyGoblin".speed < $"../Player".speed:
			$"../ShittyGoblin".health -= 2 * $"../Player".strength
			#Attacking arms reduces strength.
			$"../ShittyGoblin".strength -= 1
			if $"../ShittyGoblin".health > 0:
				enemyAttack()
		elif $"../ShittyGoblin".speed >= $"../Player".speed:
			enemyAttack()
			if $"../Player".health > 0:
				$"../ShittyGoblin".health -= 2 * $"../Player".strength
				$"../ShittyGoblin".strength -= 1
	armsUnHover()
	attackReset()

func chestSelect():
	if $"../Player".health > 0 and $"../ShittyGoblin".health > 0:
		if $"../ShittyGoblin".speed < $"../Player".speed:
			#Attacking torso reduces health by more.
			$"../ShittyGoblin".health -= 2.5 * $"../Player".strength
			if $"../ShittyGoblin".health > 0:
				enemyAttack()
		elif $"../ShittyGoblin".speed >= $"../Player".speed:
			enemyAttack()
			if $"../Player".health > 0:
				$"../ShittyGoblin".health -= 2.5 * $"../Player".strength
	chestUnHover()
	attackReset()


func returnToOverworld():
	get_tree().change_scene("res://Main.tscn")


func restartLevel():
	#This isn't quite resetting right.
	Global.shittyMeatOwned = Global.shittyMeatOwnedDefault
	Global.deadGoblinsOverworld = Global.deadGoblinsOverworldDefault
	Global.currentGoblin = Global.currentGoblinDefault
	get_tree().change_scene("res://Main.tscn")


func printStats():
	print("-----------------")
	print("Goblin speed: " + str($"../ShittyGoblin".speed))
	print("Goblin strength: " + str($"../ShittyGoblin".strength))
	print("Player speed: " + str($"../Player".speed))
	print("Player strength: " + str($"../Player".strength))
	print("-----------------")
