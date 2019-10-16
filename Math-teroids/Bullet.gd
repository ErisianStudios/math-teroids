extends Area2D

var speed:int = 300
var lifetime:float = 1
var screen_size
var screen_buffer = 5

var velocity:Vector2

func _ready():
	screen_size = get_viewport_rect().size

func start(_pos, _dir):
	position = _pos
	rotation = _dir.angle()
	$Lifetime.wait_time = lifetime
	velocity = _dir * speed

func _process(delta):
	position += velocity * delta
	position.x = wrapf(position.x, -screen_buffer, screen_size.x + screen_buffer)
	position.y = wrapf(position.y, -screen_buffer, screen_size.y + screen_buffer)


func _on_Lifetime_timeout():
	destroyme()
	
func destroyme():
	queue_free()


func _on_Bullet_area_entered(area):
	if area.has_method("check_value"):
		area.check_value()
		destroyme()
