extends Area2D
var swinging = false
func _process(delta):
	if Input.is_action_just_pressed("swing") and swinging == false:
		$"../playerAnimator".play("swing")
		self.monitoring = true
		swinging = true


func swingHit( area ):
	if area.is_in_group("enemies"):
		if area.currentGoblin == false:
			Global.currentGoblin = area.get_name()
			Global.currentMainScenePath = "res://" + get_tree().get_current_scene().get_name() + ".tscn"
			print(Global.currentMainScenePath)
			get_tree().change_scene("res://Combat.tscn")
		


func swingFinish( name ):
	if name == "swing":
		swinging = false
		self.monitoring = false
