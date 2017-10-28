extends Area2D
var currentGoblin = false

func _ready():
	if self.get_name() in Global.deadGoblinsOverworld:
		self.queue_free()

func _process(delta):
	if Global.currentGoblin == self.get_name():
		currentGoblin = true
	if currentGoblin == true:
		$Goblin.visible = false
		$shittyMeat.visible = true

func playerDetected( body ):
	if body.is_in_group("player"):
		if currentGoblin == false:
			Global.currentGoblin = self.get_name()
			Global.currentMainScenePath = "res://" + get_tree().get_current_scene().get_name() + ".tscn"
			print(Global.currentMainScenePath)
			get_tree().change_scene("res://Combat.tscn")
		else:
			Global.shittyMeatOwned += 1
			Global.deadGoblinsOverworld.append(self.get_name())
			self.queue_free()

func _on_idleTimer_timeout():
		$goblinAnimator.play("idle")
