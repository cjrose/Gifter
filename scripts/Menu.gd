extends MarginContainer

# whether or not presents should rain
var dropping = false

var present_scene = load("res://_scenes/Game/Present-menu.tscn")
var viewport_size
export var amount = 120
# frames before spawning a new present
export var delay = 5
var counter

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	dropping = true
	viewport_size = get_viewport().size
	counter = delay

func _physics_process(delta):
	counter -= 1
	if counter == 0:
		var inst = present_scene.instance()
		inst.position.x = (0.75)*viewport_size.x
		inst.position.y = (-50) # magic numbers weeeeeeeeeeee
		inst.present_color = rng.randi_range(0, 3)
		self.add_child(inst, true)
		print(inst.name)
		counter = delay

	var presents = get_tree().get_nodes_in_group("present")
	for p in presents:
		if p.position.y > viewport_size.y:
			p.queue_free()