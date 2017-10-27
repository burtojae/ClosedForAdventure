extends Sprite

var health = 100
var speed = 10
var strength = 10

func _process(delta):
	$PlayerHealth.value = health
