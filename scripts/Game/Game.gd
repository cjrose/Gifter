extends Node2D

# Time before the game starts
var initial_startup_time = 3
# This controls the seconds before another elf is spawned
# gradually decreases over game lifespan
export var difficulty = 4
# Minimum amount of time before elf spawns
export var min_time = 2
# Time to be removed from difficulty every spawn
export var progression = 0.15
# Max amount of times player can fail to deliver a present
export var lives = 3
# Seconds after a failed delivery that spawns will not happen
export var fail_time_buffer = 5

# Keeps track of player score
# 100 pts for successful gifting
# -50 pts for a gift that reaches the end of the table without being picked up
# -100 pts for letting the enemy elf reach the end of the table
var score = 0
var points = [100, -50, -100]

signal score_change
signal lives_change

var rng = RandomNumberGenerator.new()
var elf_enemy_scene = load("res://_scenes/Game/ElfEnemy.tscn")

func _ready():
	rng.randomize()
	$Timer.start(initial_startup_time)
	self.connect("score_change", $HUD, "_on_score_change")
	self.connect("lives_change", $HUD, "_on_lives_change")
	emit_signal("lives_change", self.lives)

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
	_lose_life()
	_update_score(self.points[2])

func _on_gift_successful_delivery():
	_update_score(self.points[0])

func _on_gift_reached_end():
	_update_score(self.points[1])

func _update_score(points):
	self.score += points
	if self.score < 0:
		self.score = 0
	emit_signal("score_change", self.score)

func _lose_life():
	self.lives -= 1
	emit_signal("lives_change", self.lives)
	_reset_game()

func _reset_game():
	$Character.pos = 0
	# try again text maybe?
	
	$Timer.start(fail_time_buffer)
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	for enemy in enemies:
		enemy.queue_free()
	
	var presents = get_tree().get_nodes_in_group("present")
	for present in presents:
		present.queue_free()