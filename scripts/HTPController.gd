extends VBoxContainer

var MenuScene = "res://_scenes/Menu.tscn"

func _ready():
	$BackBtn.grab_focus()

func _on_BackBtn_pressed():
	self.get_tree().change_scene(MenuScene)
