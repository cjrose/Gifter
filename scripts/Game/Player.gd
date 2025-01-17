extends RigidBody2D

# Preset position of the player
var pos = 0
# List of position vectors
var player_pos_list = []
var carrying_present = false 
var movable = true

signal throw_present

var throw_present = load("res://sfx/throw-present.ogg")

func _ready():
	var positions = $"../PlayerPositions"
	for pos in positions.get_children():
		player_pos_list.append(pos.position)
	
	$SFX.stream = throw_present
	self.position = Vector2(player_pos_list[pos][0], player_pos_list[pos][1])

func _process(delta):
	if Input.is_action_just_pressed('ui_up'):
		if pos > 0:
			pos -= 1
	if Input.is_action_just_pressed('ui_down'):
		if pos < len(player_pos_list) - 1:
			pos += 1
	
	if Input.is_action_just_pressed('ui_left'):
		$AnimatedSprite.flip_h = true
		carrying_present = true
		$AnimatedSprite.frame = self.pos + 2
		
	if movable and Input.is_action_just_pressed('ui_right'):
		$AnimatedSprite.flip_h = false
		if carrying_present:
			emit_signal("throw_present", pos, $AnimatedSprite.frame - 2)
			$SFX.play()
			$AnimatedSprite.frame = 0
			carrying_present = false

func _physics_process(delta):
	self.position = Vector2(player_pos_list[pos][0], player_pos_list[pos][1])