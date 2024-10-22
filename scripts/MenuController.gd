extends VBoxContainer

var GameScene = "res://_scenes/Game/Game.tscn"
var CreditsScene = "res://_scenes/Credits.tscn"
var HowToScene = "res://_scenes/HowToPlay.tscn"
onready var menusfx = get_node("/root/MenuSFX")

func _ready():
	$PlayBtn.grab_focus()

func _on_PlayBtn_pressed():
	self.menusfx.play()
	self.get_tree().change_scene(GameScene)

func _on_CreditsBtn_pressed():
	self.menusfx.play()
	self.get_tree().change_scene(CreditsScene)

func _on_QuitBtn_pressed():
	self.menusfx.play()
	self.get_tree().quit()

func _on_HowToBtn_pressed():
	self.menusfx.play()
	self.get_tree().change_scene(HowToScene)
