extends Area2D

const MOVE_SPEED = 255

var _ball_dir
var _up
var _down
var n

onready var _screen_size_y = get_viewport_rect().size.y

func _ready():
	n = String(name).to_lower()
	_up = n + "_move_up"
	_down = n + "_move_down"  
	if n == "left":
		_ball_dir = 1
	else:
		_ball_dir = -1


func _process(delta):
	# Move up and down based on input.S
	if n == "right":
		var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
		# position.y = clamp(position.y + _ball_dir * MOVE_SPEED * delta ,16,_screen_size_y - 16)
		position.y = clamp(position.y + input * MOVE_SPEED * delta, 16, _screen_size_y - 16)


func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction.
		#area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
		global.ball_direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
		global.score += 1
		#global.ball_direction = direction
