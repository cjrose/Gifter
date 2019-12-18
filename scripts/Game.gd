extends Node2D

# Time before the game starts
var initial_startup_time = 3
# This controls the seconds before another elf is spawned
# gradually decreases over game lifespan
export var difficulty = 3
# Minimum amount of time before elf spawns
export var min_time = 1
# Time to be removed from difficulty every spawn
export var progression = 0.1

func _ready():
	$Timer.start(initial_startup_time)

func _on_Timer_timeout():
	_spawn_elf()
	
	$Timer.start(difficulty)
	if difficulty > min_time:
		difficulty -= progression

func _spawn_elf():
	pass
