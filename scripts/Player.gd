extends RigidBody2D

# Preset position of the player
var pos = 0
# Number of "lives" the player has
var attempts = 4
# List of position vectors
var player_pos_list = []


func _ready():
	var positions = $"../PlayerPositions"
	for pos in positions.get_children():
		player_pos_list.append(pos.position)
	
	self.position = Vector2(player_pos_list[pos][0], player_pos_list[pos][1])

func _process(delta):
	pass 

func _physics_process(delta):
	if Input.is_action_just_pressed('ui_down'):
		if pos < len(player_pos_list) - 1:
			pos += 1
	if Input.is_action_just_pressed('ui_up'):
		if pos > 0:
			pos -= 1
	
	self.position = Vector2(player_pos_list[pos][0], player_pos_list[pos][1])