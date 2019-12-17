extends RigidBody2D

# 0 	Red
# 1 	Green
# 2 	Blue
# 3 	Yellow
# default value to avoid errors
export var present_color = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = present_color