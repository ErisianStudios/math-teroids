extends Node

var screen_size
var score: int
var n1: int
var n2: int
var eq = ""
var answer: int
var lives : int = 3
var main_scene = load("res://Main.tscn")
var game_over_scene = load("res://GameOver.tscn")

func _ready():
	_new_equation()
	spawn._spawn_asteroid_value(answer)

func _unhandled_input(event):
	if Input.is_action_just_pressed("restart"):
		_restart_game()
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _new_equation():
	randomize()
	n1 = randi() % 11
	n2 = randi() % 11
	eq = str(n1) + " + " + str(n2)
	answer = n1 + n2
	spawn._spawn_asteroid_value(answer)
	
func _on_player_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)


func _lose_life():
	lives -= 1
	if lives <= 0:
		_game_over()

func _restart_game():
	var roids = get_tree().get_nodes_in_group("Asteroids")
	for roid in roids:
		roid.queue_free()
	lives = 3
	score = 0
	get_tree().change_scene_to(main_scene)
	_new_equation()
	spawn._spawn_asteroid_value(answer)

func _game_over():
	var roids = get_tree().get_nodes_in_group("Asteroids")
	for roid in roids:
		roid.queue_free()
	get_tree().change_scene_to(game_over_scene)