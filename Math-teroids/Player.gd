extends Area2D

signal shoot

onready var shot_timer = $ShotTimer
onready var firepoint = $Firepoint
onready var shot_sound = $ShootSound

const TURN_SPEED = 180
const MOVE_SPEED = 150
const ACC = 0.05
const DEC = 0.01
var motion = Vector2(0,0)
var screen_size
var screen_buffer = 8
var can_shoot = true

export (PackedScene) var bullet
func _ready():
	screen_size = get_viewport_rect().size
	spawn.init_roids()
	
func shoot():
	if can_shoot:
		can_shoot = false
		shot_timer.start()
		var dir = Vector2(1,0).rotated(rotation)
		var pos = firepoint.global_position
		global._on_player_shoot(bullet, pos, dir)
		shot_sound.play()

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		shoot()
	if Input.is_action_pressed("turn_left"):
		rotation_degrees -= TURN_SPEED * delta
	if Input.is_action_pressed("turn_right"):
		rotation_degrees += TURN_SPEED * delta
	
	var movedir = Vector2(1,0).rotated(rotation)
	
	if Input.is_action_pressed("forward"):
		motion = motion.linear_interpolate(movedir, ACC)
	else:
		motion = motion.linear_interpolate(Vector2(0,0), DEC)
	
	position += motion * MOVE_SPEED * delta
	position.x = wrapf(position.x, -screen_buffer, screen_size.x + screen_buffer)
	position.y = wrapf(position.y, -screen_buffer, screen_size.y + screen_buffer)

func _on_ShotTimer_timeout():
	can_shoot = true
