extends Area2D

onready var value_text = $Sprite/Label
onready var image = $Sprite
onready var explosion_sound = $ExplosionSound
onready var incorrect_sound = $IncorrectSound
onready var effects = $Tween
var value: int = 0
var rotation_speed : int
var move_speed : int = 50
var screen_size
var screen_buffer = 5
var dir: Vector2
var motion : Vector2

signal on_destroy

func _ready():
	screen_size = get_viewport_rect().size
	randomize()
	value_text.text = str(value)
	dir.x = rand_range(-1,1)
	dir.y = rand_range(-1,1)
	dir = dir.normalized()
	rotation_speed = rand_range(-4,4)
	motion = dir * move_speed
	effects.interpolate_property(image,"self_modulate:a",1,0,0.25,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	effects.interpolate_property(value_text,"self_modulate:a",1,0,0.25,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	effects.interpolate_property(image,"scale",image.scale,Vector2(2,2),0.33,Tween.TRANS_LINEAR,Tween.EASE_OUT)	

func _set_random_value():
	value = rand_range(0,20)

func _process(delta):
	position.x = wrapf(position.x, -screen_buffer, screen_size.x + screen_buffer)
	position.y = wrapf(position.y, -screen_buffer, screen_size.y + screen_buffer)
	
func _physics_process(delta):
	position += motion * delta
	#move_and_slide(motion)
	rotate(deg2rad(rotation_speed))
	
func check_value():
	if value == global.answer:
		explosion_sound.play()
		global._new_equation()
		global.score += 1
		
	else:
		incorrect_sound.play()
		global._lose_life()
	effects.start()
	

func _on_Timer_timeout():
	queue_free()


func _on_ExplosionSound_finished():
	queue_free()


func _on_IncorrectSound_finished():
	queue_free()
