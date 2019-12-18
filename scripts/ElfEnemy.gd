extends Area2D

# 0 - RED
# 1 - GREEN
# 2 - BLUE
# 3 - YELLOW
var elf_color

# base move speed
export var base_speed = 0.5
# amount this move speed is allowed to vary by
export var difference = 0.15

var move_speed
var moving = false
var gifted = false
var table_start_x
var table_end_x

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
		
	table_start_x = get_parent().get_node("TableStart").position.x
	table_end_x = get_parent().get_node("TableEnd").position.x
	move_speed = rng.randf_range(base_speed - difference, base_speed + difference)
	
func _physics_process(delta):
	# TODO add present collision detection
	if moving and not gifted:
		self.position += Vector2(-move_speed, 0)
	
	if moving and gifted:
		self.position += Vector2(move_speed, 0)
	
	if not gifted and table_start_x > self.position.x:
		self.queue_free()
		
	if gifted and table_end_x < self.position.x:
		self.queue_free()

func _on_ElfEnemy_area_entered(area):
	if "Present" in area.name:
		if area.present_color == self.elf_color:
			area.queue_free()
			gifted = true
			$AnimatedSprite.animation = "gift"
			$AnimatedSprite.frame = self.elf_color
			$AnimatedSprite.flip_h = true
