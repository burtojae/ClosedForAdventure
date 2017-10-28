extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if $"../../":
		print("Main?")
		self.limit_left = $"../../".dimensionsLeft
		self.limit_right = $"../../".dimensionsRight
		self.limit_bottom = $"../../".dimensionsDown
		self.limit_top = $"../../".dimensionsUp
