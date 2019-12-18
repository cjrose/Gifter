extends StaticBody2D

var present_scene = load("res://_scenes/Game/Present.tscn")
export var table_id = 0

func _ready():
	$"../../Character".connect("throw_present", self, "_on_present_throw")


func _on_present_throw(id, present_color):
	if table_id == id:
		var instance = present_scene.instance()
		instance.present_color = present_color
		self.add_child(instance, true)
		instance.position = $TableStart.position
		instance.moving = true