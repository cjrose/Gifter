extends MarginContainer

onready var global_script = get_node("/root/Global")
var modulate_hover = Color(0.5, 0.5, 0.5, 1)
var modulate_not_hover = Color(1, 1, 1, 1)
var MainMenu = "res://_scenes/Menu.tscn"

func _ready():
	$VBoxContainer/PointsLabel.text = "SCORE: " + ("%08d" % global_script.score)

func _on_BackToMenuBtn_pressed():
	self.get_tree().change_scene(MainMenu)

func _on_BackToMenuBtn_mouse_entered():
	$VBoxContainer/HBoxContainer2/BackToMenuBtn.modulate = modulate_hover

func _on_BackToMenuBtn_mouse_exited():
	$VBoxContainer/HBoxContainer2/BackToMenuBtn.modulate = modulate_not_hover
