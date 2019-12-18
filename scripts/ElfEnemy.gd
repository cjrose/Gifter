extends RigidBody2D

# 0 - RED
# 1 - GREEN
# 2 - BLUE
# 3 - YELLOW
var elf_color

# base move speed
export var base_speed = 0.5
# amount this move speed is allowed to vary by
export var difference = 0.25

var move_speed
var moving = false
var gifted = false
var end_x = 0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	if elf_color == 0:
		$AnimatedSprite.play("run_r")
	if elf_color == 1:
		$AnimatedSprite.play("run_g")
	if elf_color == 2:
		$AnimatedSprite.play("run_b")
	if elf_color == 3:
		$AnimatedSprite.play("run_y")
		
	end_x = get_parent().get_node("TableStart").position.x
	move_speed = rng.randf_range(base_speed - difference, base_speed + difference)
	
func _physics_process(delta):
	# TODO add present collision detection
	if moving:
		self.position += Vector2(-move_speed, 0)
	
	if end_x > self.position.x:
		print('delete elf')
		self.queue_free()