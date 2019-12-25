extends VBoxContainer

var MenuScene = "res://_scenes/Menu.tscn"
var license_url = "https://cjrose.github.io/strg/gifter_licensing.html"

onready var menusfx = get_node("/root/MenuSFX")

func _ready():
	$LicenseBtn.grab_focus()

func _on_BackBtn_pressed():
	self.menusfx.play()
	self.get_tree().change_scene(MenuScene)

func _on_LicenseBtn_pressed():
	self.menusfx.play()
	OS.shell_open(license_url)
