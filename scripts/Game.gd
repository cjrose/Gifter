extends Node2D

# Time before the game starts
var initial_startup_time = 3
# This controls the seconds before another elf is spawned
# gradually decreases over game lifespan
export var difficulty = 3
# Time to be removed from difficulty every spawn
export var progression = 0.1

func _ready():
	$Timer.start(initial_startup_time)

func _on_Timer_timeout():
	_spawn_elf()
	
	$Timer.start(difficulty)
	difficulty -= progression

func _spawn_elf():
	print('spawn_elf')
