extends Node

@export var RockScene : PackedScene

var screensize = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport().get_visible_rect().size
	for i in 10:
		spawn_rock(3)


func spawn_rock(size, pos=null, vel=null):
	if pos == null:
		$RockPath/RockSpawn.progress = randi()
		pos = $RockPath/RockSpawn.position
	if vel == null:
		vel = Vector2.RIGHT.rotated(randf_range(0, TAU)) * randf_range(50, 125)

	var r = RockScene.instantiate()
	r.screensize = screensize
	r.start(pos, vel, size)
	call_deferred("add_child", r)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
