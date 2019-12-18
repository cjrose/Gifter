extends Node2D

# Time before the game starts
var initial_startup_time = 3
# This controls the seconds before another elf is spawned
# gradually decreases over game lifespan
export var difficulty = 5
# Minimum amount of time before elf spawns
export var min_time = 3
# Time to be removed from difficulty every spawn
export var progression = 0.15

# Keeps track of player score
# 100 pts for successful gifting
# -50 pts for a gift that reaches the end of the table without being picked up
# -100 pts for letting the enemy elf reach the end of the table
var score = 0
var points = [100, -50, -100]

signal score_change

var rng = RandomNumberGenerator.new()
var elf_enemy_scene = load("res://_scenes/ElfEnemy.tscn")

func _ready():
	rng.randomize()
	$Timer.start(initial_startup_time)
	self.connect("score_change", $HUD, "_on_score_change")

func _on_Timer_timeout():
	_spawn_elf()
	
	$Timer.start(difficulty)
	if difficulty > min_time:
		difficulty -= progression

func _spawn_elf():
	# pick a random table
	var table_id = rng.randi_range(0, 3)
	# pick an elf color
	var elf_color = rng.randi_range(0, 3)
	
	var new_instance = elf_enemy_scene.instance()
	new_instance.elf_color = elf_color
	# I hate gdscript / python for not having switch cases
	if table_id == 0:
		$Tables/table_0.add_child(new_instance)
		new_instance.position = $Tables/table_0/TableEnd.position
		new_instance.moving = true
	
	if table_id == 1:
		$Tables/table_1.add_child(new_instance)
		new_instance.position = $Tables/table_1/TableEnd.position
		new_instance.moving = true
	
	if table_id == 2:
		$Tables/table_2.add_child(new_instance)
		new_instance.position = $Tables/table_2/TableEnd.position
		new_instance.moving = true
	
	if table_id == 3:
		$Tables/table_3.add_child(new_instance)
		new_instance.position = $Tables/table_3/TableEnd.position
		new_instance.moving = true

func _on_gift_failed_delivery():
	self.score += self.points[2]
	emit_signal("score_change", self.score)

func _on_gift_successful_delivery():
	self.score += self.points[0]
	emit_signal("score_change", self.score)

func _on_gift_reached_end():
	self.score += self.points[1]
	emit_signal("score_change", self.score)