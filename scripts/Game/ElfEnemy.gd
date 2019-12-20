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
var failed = false
var table_start_x
var table_end_x

var rng = RandomNumberGenerator.new()

signal gift_failed_delivery
signal gift_successful_delivery

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
	self.connect("gift_failed_delivery", $"/root/Game", "_on_gift_failed_delivery")
	self.connect("gift_successful_delivery", $"/root/Game", "_on_gift_successful_delivery")
	
func _physics_process(delta):
	if moving and not gifted and not failed:
		self.position += Vector2(-move_speed, 0)
	
	if moving and gifted:
		self.position += Vector2(move_speed, 0)
	
	if not gifted and table_start_x + 5 > self.position.x and not failed:
		failed = true
		emit_signal("gift_failed_delivery")
		if elf_color == 0:
			$AnimatedSprite.play("stop_r")
		if elf_color == 1:
			$AnimatedSprite.play("stop_g")
		if elf_color == 2:
			$AnimatedSprite.play("stop_b")
		if elf_color == 3:
			$AnimatedSprite.play("stop_y")
		
	if gifted and table_end_x < self.position.x:
		self.queue_free()

func _on_ElfEnemy_area_entered(area):
	if "Present" in area.name:
		if area.present_color == self.elf_color:
			area.queue_free()
			self.gifted = true
			self.move_speed = (base_speed + base_speed)
			if self.elf_color == 0:
				$AnimatedSprite.play("gift_r")
			if self.elf_color == 1:
				$AnimatedSprite.play("gift_g")
			if self.elf_color == 2:
				$AnimatedSprite.play("gift_b")
			if self.elf_color == 3:
				$AnimatedSprite.play("gift_y")
			$AnimatedSprite.flip_h = true
			emit_signal("gift_successful_delivery")


func _on_AnimatedSprite_animation_finished():
	# Only happens in the stop animation
	if $AnimatedSprite.animation == "stop_r":
		$AnimatedSprite.play("shake_r")
	if $AnimatedSprite.animation == "stop_g":
		$AnimatedSprite.play("shake_g")
	if $AnimatedSprite.animation == "stop_b":
		$AnimatedSprite.play("shake_b")
	if $AnimatedSprite.animation == "stop_y":
		$AnimatedSprite.play("shake_y")
