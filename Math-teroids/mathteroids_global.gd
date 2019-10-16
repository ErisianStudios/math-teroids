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

enum grade {Kindergarden,First,Second,Third,Fourth,Fifth}
var grade_set = grade.Kindergarden

func _ready():
	OS.set_window_size(Vector2(640*2,360*2))
	randomize()
	_new_equation()
	spawn._spawn_asteroid_value(answer)

func _unhandled_input(event):
	if Input.is_action_just_pressed("restart"):
		_restart_game()
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _new_equation():
	match grade_set:
		grade.Kindergarden:
			generate_kindergarden()
		grade.First:
			generate_first()
		grade.Second:
			generate_second()
		grade.Third:
			generate_third()
		grade.Fourth:
			generate_fourth()
		grade.Fifth:
			generate_fifth()
	
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
	
func generate_kindergarden():
	randomize()
	n1 = randi() % 11
	n2 = randi() % 11
	eq = str(n1) + " + " + str(n2)
	answer = n1 + n2
	spawn._spawn_asteroid_value(answer)

func generate_first():
	randomize()
	var rnd = randi() % 2
	if rnd == 0:
		n1 = randi() % 11
		n2 = randi() % 11
		eq = str(n1) + " + " + str(n2)
		answer = n1 + n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 1:
		n1 = randi() % 11
		n2 = randi() % 11
		eq = str(n1) + " - " + str(n2)
		answer = n1 - n2
		spawn._spawn_asteroid_value(answer)

func generate_second():
	randomize()
	var rnd = randi() % 2
	if rnd == 0:
		n1 = randi() % 26
		n2 = randi() % 26
		eq = str(n1) + " + " + str(n2)
		answer = n1 + n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 1:
		n1 = randi() % 26
		n2 = randi() % 26
		eq = str(n1) + " - " + str(n2)
		if n1 < n2:
			var tmp = n1
			n1 = n2
			n2 = tmp
		answer = n1 - n2
		spawn._spawn_asteroid_value(answer)

func generate_third():
	randomize()
	var rnd = randi() % 3
	if rnd == 0:
		n1 = randi() % 100
		n2 = randi() % 100
		eq = str(n1) + " + " + str(n2)
		answer = n1 + n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 1:
		n1 = randi() % 100
		n2 = randi() % 100
		eq = str(n1) + " - " + str(n2)
		if n1 < n2:
			var tmp = n1
			n1 = n2
			n2 = tmp
		answer = n1 - n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 2:
		n1 = randi() % 25
		n2 = randi() % 10
		eq = str(n1) + " x " + str(n2)
		answer = n1 * n2
		spawn._spawn_asteroid_value(answer)

func generate_fourth():
	randomize()
	var rnd = randi() % 3
	if rnd == 0:
		n1 = randi() % 500
		n2 = randi() % 500
		eq = str(n1) + " + " + str(n2)
		answer = n1 + n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 1:
		n1 = randi() % 500
		n2 = randi() % 500
		eq = str(n1) + " - " + str(n2)
		if n1 < n2:
			var tmp = n1
			n1 = n2
			n2 = tmp
		answer = n1 - n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 2:
		n1 = randi() % 50
		n2 = randi() % 30
		eq = str(n1) + " x " + str(n2)
		answer = n1 * n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 3:
		n1 = randi() % 100
		n2 = randi() % 15
		eq = str(n1) + " / " + str(n2)
		answer = n1 / n2
		spawn._spawn_asteroid_value(answer)
		pass

func generate_fifth():
	randomize()
	var rnd = randi() % 3
	if rnd == 0:
		n1 = randi() % 750
		n2 = randi() % 750
		eq = str(n1) + " + " + str(n2)
		answer = n1 + n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 1:
		n1 = randi() % 750
		n2 = randi() % 750
		eq = str(n1) + " - " + str(n2)
		if n1 < n2:
			var tmp = n1
			n1 = n2
			n2 = tmp
		answer = n1 - n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 2:
		n1 = randi() % 150
		n2 = randi() % 150
		eq = str(n1) + " x " + str(n2)
		answer = n1 * n2
		spawn._spawn_asteroid_value(answer)
	if rnd == 3:
		n1 = randi() % 300
		n2 = randi() % 200
		eq = str(n1) + " / " + str(n2)
		answer = n1 / n2
		spawn._spawn_asteroid_value(answer)
		pass