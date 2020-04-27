extends Node2D

var _decay_rate = 0.4
var _max_offset = 20

var _start_position
var _trauma

func _ready():
	_start_position = position
	_trauma = 0.0

func _process(delta):
	if _trauma > 0:
		_decay_trauma(delta)
		_apply_shake()
		
func add_trauma(amount):
	_trauma = min(_trauma + amount, 1)
	
func _decay_trauma(delta):
	var change = _decay_rate * delta
	_trauma = max(_trauma - change, 0)

func _apply_shake():
	var shake = _trauma * _trauma
	var o_y = _max_offset * shake * _gnops()
	position = _start_position + Vector2(0, o_y)

func _gnops():
	return rand_range(-1.0, 1.0)