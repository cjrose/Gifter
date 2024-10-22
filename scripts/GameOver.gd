extends MarginContainer

onready var global_script = get_node("/root/Global")
onready var menusfx = get_node("/root/MenuSFX")
onready var musicsfx = get_node("/root/MusicPlayer")
var MainMenu = "res://_scenes/Menu.tscn"

var winsfx = load("res://sfx/win_screen.ogg")
var losesfx = load("res://sfx/lose_screen.ogg")

func _ready():
	musicsfx.stop()
	if global_script.score >= global_script.point_goal:
		$VBoxContainer/PointsLabel.text = "\n\n\n\nSCORE: " + ("%08d" % global_script.score)
		$SFX.stream = winsfx
		$VBoxContainer/PointsLabel.text += "\nYOU GAVE SANTA ENOUGH PRESENTS\nTO SAVE CHRISTMAS\n\nCONGRATULATIONS!"
		$Background.visible = true
	else:
		$VBoxContainer/PointsLabel.text = "SCORE: " + ("%08d" % global_script.score)
		$SFX.stream = losesfx
		$Background.visible = false
	$VBoxContainer/HBoxContainer2/BackToMenuBtn.grab_focus()

func _on_BackToMenuBtn_pressed():
	self.menusfx.play()
	self.get_tree().change_scene(MainMenu)

func _on_Timer_timeout():
	$SFX.play()
