extends Node

var screen_size
var asteroid_count: int = 10
var asteroid_diff: int
var asteroid = load("res://Asteroid.tscn")
var timer = 10
func _ready():
	randomize()
	pass
	
func viewport_size():
	pass

func init_roids():
	for i in asteroid_count:
		_spawn_asteroid()

func _process(delta):
	timer -= delta
	if timer <= 0:
		_spawn_asteroid()
		timer = 10

func _spawn_asteroid_value(value):
	var a = asteroid.instance()
	a.global_position = Vector2(rand_range(0,640),rand_range(0,360))
	a.value = value
	add_child(a)

func _spawn_asteroid():
	var a = asteroid.instance()
	a.global_position = Vector2(rand_range(0,640),rand_range(0,360))
	a._set_random_value()
	add_child(a)