extends VBoxContainer

var MenuScene = "res://_scenes/Menu.tscn"
var modulate_hover = Color(0.5, 0.5, 0.5, 1)
var modulate_not_hover = Color(1, 1, 1, 1)
var license_url = "https://cjrose.github.io/strg/gifter_licensing.html"

func _on_BackBtn_mouse_entered():
	$BackBtn.modulate = modulate_hover

func _on_BackBtn_mouse_exited():
	$BackBtn.modulate = modulate_not_hover

func _on_BackBtn_pressed():
	self.get_tree().change_scene(MenuScene)

func _on_LicenseBtn_mouse_entered():
	$LicenseBtn.modulate = modulate_hover

func _on_LicenseBtn_mouse_exited():
	$LicenseBtn.modulate = modulate_not_hover

func _on_LicenseBtn_pressed():
	OS.shell_open(license_url)
