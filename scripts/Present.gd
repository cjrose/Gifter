extends RigidBody2D

enum TYPE {
	RED,
	GREEN,
	BLUE,
	YELLOW
}

var present_type

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_get_new_type()
	
	get_node("/root/Game/Character").connect("player_pickup", self, "_on_player_pickup")
	
func _on_player_pickup():
	_get_new_type()

func _get_new_type():
	rng.randomize()
	var num = rng.randi_range(0,3)
	if num == 0:
		present_type = TYPE.RED
	if num == 1:
		present_type = TYPE.GREEN
	if num == 2:
		present_type = TYPE.BLUE
	if num == 3:
		present_type = TYPE.YELLOW