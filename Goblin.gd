extends Sprite
var health = 100
var speed = 10
var strength = 10

func _process(delta):
	$goblinHealth.value = health
func attackHead():
	$"../Player".health -= 2 * strength
	print("Go for the eyes!!!!!!!!")
func attackArms():
	$"../Player".health -= 2 * strength
	$"../Player".strength -= 1
	print("Take off his..! Wait where are his arms?!")
func attackFeet():
	$"../Player".health -= 2 * strength
	$"../Player".speed -= 2
	print("No feet either...")
func attackBody():
	$"../Player".health -= 2.5 * strength
	print("Go for his... torso? Is this guy just a head?")