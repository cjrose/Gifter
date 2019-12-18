extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_score_change(score):
	var text = "SCORE: " + ("%08d" % score)
	$HBoxContainer/Score.text = text

func _on_lives_change(amt):
	var text = "LIVES: " + str(amt)
	$HBoxContainer/Lives.text = text