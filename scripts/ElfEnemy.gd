extends RigidBody2D

# 0 - RED
# 1 - GREEN
# 2 - BLUE
# 3 - YELLOW
var elf_color

var gifted = false

func _ready():
	if elf_color == 0:
		$AnimatedSprite.play("run_r")
	if elf_color == 1:
		$AnimatedSprite.play("run_g")
	if elf_color == 2:
		$AnimatedSprite.play("run_b")
	if elf_color == 3:
		$AnimatedSprite.play("run_y")
	
func _physics_process(delta):
	# TODO add present collision detection
	pass