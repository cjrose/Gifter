extends VBoxContainer

var MenuScene = "res://_scenes/Menu.tscn"
var license_url = "https://cjrose.github.io/strg/gifter_licensing.html"

func _ready():
	$LicenseBtn.grab_focus()

func _on_BackBtn_pressed():
	self.get_tree().change_scene(MenuScene)

func _on_LicenseBtn_pressed():
	OS.shell_open(license_url)
