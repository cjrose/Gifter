extends MarginContainer

onready var global_script = get_node("/root/Global")
var MainMenu = "res://_scenes/Menu.tscn"

func _ready():
	$VBoxContainer/PointsLabel.text = "SCORE: " + ("%08d" % global_script.score)
	if global_script.score >= global_script.point_goal:
		$VBoxContainer/PointsLabel.text += "\nYOU GAVE SANTA ENOUGH PRESENTS\nTO SAVE CHRISTMAS\n\nCONGRATULATIONS!"
	$VBoxContainer/HBoxContainer2/BackToMenuBtn.grab_focus()

func _on_BackToMenuBtn_pressed():
	self.get_tree().change_scene(MainMenu)