extends RigidBody2D

# 0 	Red
# 1 	Green
# 2 	Blue
# 3 	Yellow
# default value to avoid errors
export var present_color = 0
var move_speed = 0.75
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = present_color

func _physics_process(delta):
	if moving:
		position += Vector2(move_speed, 0)