extends VBoxContainer

var modulate_hover = Color(0.5, 0.5, 0.5, 1)
var modulate_not_hover = Color(1, 1, 1, 1)

var MenuScene = "res://_scenes/Menu.tscn"

func _ready():
	$BackBtn.grab_focus()

func _on_BackBtn_mouse_entered():
	$BackBtn.modulate = modulate_hover

func _on_BackBtn_mouse_exited():
	$BackBtn.modulate = modulate_not_hover

func _on_BackBtn_pressed():
	self.get_tree().change_scene(MenuScene)

func _on_BackBtn_focus_entered():
	$BackBtn.modulate = modulate_hover

func _on_BackBtn_focus_exited():
	$BackBtn.modulate = modulate_not_hover
