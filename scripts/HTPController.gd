extends VBoxContainer

var MenuScene = "res://_scenes/Menu.tscn"
onready var menusfx = get_node("/root/MenuSFX")

func _ready():
	$BackBtn.grab_focus()

func _on_BackBtn_pressed():
	self.menusfx.play()
	self.get_tree().change_scene(MenuScene)
