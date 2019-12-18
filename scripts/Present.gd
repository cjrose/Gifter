extends Area2D

# 0 	Red
# 1 	Green
# 2 	Blue
# 3 	Yellow
# default value to avoid errors
export var present_color = 0
var move_speed = 0.75
var moving = false
var end_x = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = present_color
	end_x = get_parent().position.x

func _physics_process(delta):
	if moving:
		position += Vector2(move_speed, 0)
	
	if self.position.x > end_x:
		self.queue_free()
		var game_node = get_node("/Root/Game")
		game_node.score += game_node.points[1]
	