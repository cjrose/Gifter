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

signal gift_reached_end

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frame = present_color
	end_x = $"../TableEnd".position.x
	self.connect("gift_reached_end", $"/root/Game", "_on_gift_reached_end")

func _physics_process(delta):
	if moving:
		position += Vector2(move_speed, 0)
	
	if self.position.x > end_x:
		emit_signal("gift_reached_end")
		self.queue_free()
	