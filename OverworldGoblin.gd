extends Area2D
var currentGoblin = false

func _ready():
	if self.get_name() in Global.deadGoblinsOverworld:
		self.queue_free()

func _process(delta):
	if Global.currentGoblin == self.get_name():
		currentGoblin = true
	if currentGoblin == true:
		$ShittyGoblin.visible = false
		$shittyMeat.visible = true

func playerDetected( body ):
	if body.is_in_group("player"):
		if currentGoblin == false:
			Global.currentGoblin = self.get_name()
			get_tree().change_scene("res://Combat.tscn")
		else:
			Global.shittyMeatOwned += 1
			Global.deadGoblinsOverworld.append(self.get_name())
			self.queue_free()