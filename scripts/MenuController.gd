extends VBoxContainer

var GameScene = "res://_scenes/Game/Game.tscn"
var CreditsScene = "res://_scenes/Credits.tscn"
var HowToScene = "res://_scenes/HowToPlay.tscn"

var modulate_hover = Color(0.5, 0.5, 0.5, 1)
var modulate_not_hover = Color(1, 1, 1, 1)

func _ready():
	$PlayBtn.grab_focus()

func _on_PlayBtn_pressed():
	self.get_tree().change_scene(GameScene)

func _on_CreditsBtn_pressed():
	self.get_tree().change_scene(CreditsScene)

func _on_QuitBtn_pressed():
	self.get_tree().quit()

func _on_HowToBtn_pressed():
	self.get_tree().change_scene(HowToScene)

func _on_PlayBtn_mouse_entered():
	$PlayBtn.modulate = modulate_hover

func _on_PlayBtn_mouse_exited():
	$PlayBtn.modulate = modulate_not_hover

func _on_HowToBtn_mouse_entered():
	$HowToBtn.modulate = modulate_hover

func _on_HowToBtn_mouse_exited():
	$HowToBtn.modulate = modulate_not_hover

func _on_CreditsBtn_mouse_entered():
	$CreditsBtn.modulate = modulate_hover

func _on_CreditsBtn_mouse_exited():
	$CreditsBtn.modulate = modulate_not_hover

func _on_QuitBtn_mouse_entered():
	$QuitBtn.modulate = modulate_hover

func _on_QuitBtn_mouse_exited():
	$QuitBtn.modulate = modulate_not_hover

func _on_PlayBtn_focus_entered():
	$PlayBtn.modulate = modulate_hover

func _on_PlayBtn_focus_exited():
	$PlayBtn.modulate = modulate_not_hover

func _on_HowToBtn_focus_entered():
	$HowToBtn.modulate = modulate_hover

func _on_HowToBtn_focus_exited():
	$HowToBtn.modulate = modulate_not_hover

func _on_CreditsBtn_focus_entered():
	$CreditsBtn.modulate = modulate_hover

func _on_CreditsBtn_focus_exited():
	$CreditsBtn.modulate = modulate_not_hover

func _on_QuitBtn_focus_entered():
	$QuitBtn.modulate = modulate_hover

func _on_QuitBtn_focus_exited():
	$QuitBtn.modulate = modulate_not_hover
