extends RigidBody2D

# Preset position of the player
var pos = 0
# Number of "lives" the player has
var attempts = 4
# List of position vectors
var player_pos_list = []

var carrying_present = false 
var present_scene = load("res://_scenes/Present.tscn")
signal player_pickup


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
		if pos == 0 and not carrying_present:
			carrying_present = true
			emit_signal("player_pickup")
			var type_of_present = get_node("/root/Game/Present").present_type
			var instance = present_scene.instance()
			self.add_child(instance)
		if pos != 0 and carrying_present:
			pass

func _physics_process(delta):
	self.position = Vector2(player_pos_list[pos][0], player_pos_list[pos][1])
	
	if pos > 0:
		$Sprite.flip_h = false
	else: 
		$Sprite.flip_h = true