extends Control

onready var ship = $Panel/Ship
onready var tween = $Panel/Ship/Tween
onready var ship2 = $Panel/Ship2
onready var tween2 = $Panel/Ship2/Tween

func _ready():
	randomize()
	tween.interpolate_property(ship,"rotation_degrees",0,360 * 100,500,Tween.TRANS_LINEAR,Tween.EASE_OUT_IN)
	tween.start()
	tween2.interpolate_property(ship2,"rotation_degrees",0,-360 * 100,500,Tween.TRANS_LINEAR,Tween.EASE_OUT_IN)
	tween2.start()

func load_main_scene():
	get_tree().change_scene("res://Main.tscn")
	
func _on_Kindergarden_pressed():
	global.grade_set = global.grade.Kindergarden
	load_main_scene()

func _on_First_pressed():
	global.grade_set = global.grade.First
	load_main_scene()

func _on_Second_pressed():
	global.grade_set = global.grade.Second
	load_main_scene()

func _on_Third_pressed():
	global.grade_set = global.grade.Third
	load_main_scene()
func _on_Fourth_pressed():
	global.grade_set = global.grade.Fourth
	load_main_scene()

func _on_Fifth_pressed():
	global.grade_set = global.grade.Fifth
	load_main_scene()


