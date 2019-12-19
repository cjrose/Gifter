extends VBoxContainer

var GameScene = "res://_scenes/Game/Game.tscn"
var CreditsScene = "res://_scenes/Game/Credits.tscn"


func _on_PlayBtn_pressed():
	self.get_tree().change_scene(GameScene)


func _on_CreditsBtn_pressed():
	self.get_tree().change_scene(CreditsScene)


func _on_QuitBtn_pressed():
	self.get_tree().quit()