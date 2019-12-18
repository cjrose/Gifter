extends RigidBody2D

# Preset position of the player
var pos = 0
# List of position vectors
var player_pos_list = []
var carrying_present = false 

signal throw_present


func _ready():
	var positions = $"../PlayerPositions"
	for pos in positions.get_children():
		player_pos_list.append(pos.position)
	
	self.position = Vector2(player_pos_list[pos][0], player_pos_list[pos][1])

func _process(delta):
	if Input.is_action_just_pressed('ui_up'):
		if pos > 0:
			pos -= 1
	if Input.is_action_just_pressed('ui_down'):
		if pos < len(player_pos_list) - 1:
			pos += 1
	if Input.is_action_just_pressed('ui_select'):
		# facing towards the gift droppers
		if $AnimatedSprite.flip_h == true and not carrying_present:
			carrying_present = true
			$AnimatedSprite.frame = pos+2
		# facing towards the tables
		if $AnimatedSprite.flip_h == false and carrying_present:
			carrying_present = false
			emit_signal("throw_present", pos, $AnimatedSprite.frame-2)
			$AnimatedSprite.frame = 0
	
	if Input.is_action_just_pressed('ui_left'):
		$AnimatedSprite.flip_h = true
	if Input.is_action_just_pressed('ui_right'):
		$AnimatedSprite.flip_h = false

func _physics_process(delta):
	self.position = Vector2(player_pos_list[pos][0], player_pos_list[pos][1])