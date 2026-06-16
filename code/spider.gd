extends CharacterBody2D
var caller_direct = 0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	if Trader.fear == true:
		$Sprite2D.self_modulate.a = 1
	if Trader.dead == true:
		Trader.dans_area = false
	if Trader.dans_area == false:
		if not is_on_floor():
			velocity += get_gravity() * delta
		caller_direct = 0
	else:
		caller_direct = 0
		var movement = Vector2.ZERO
		if Input.is_action_pressed('ui_a'):
			if Input.is_action_pressed("ui_v"):
				$".".rotation_degrees -= 3
			else:
				$".".rotation_degrees -= 1
			caller_direct = 1
		if Input.is_action_pressed('ui_d'):
			if Input.is_action_pressed("ui_v"):
				$".".rotation_degrees += 3
			else:
				$".".rotation_degrees += 1
			caller_direct = 2
		if Input.is_action_pressed('ui_w'):
			movement = Vector2.UP.rotated(deg_to_rad(rotation_degrees))
			caller_direct = 3
		if Input.is_action_pressed('ui_s'):
			movement = Vector2.DOWN.rotated(deg_to_rad(rotation_degrees))
			caller_direct = 4
		if Input.is_action_pressed("ui_v"):
			velocity = movement * 900
		else:
			velocity = movement * 300
	move_and_slide()
	if caller_direct == 1:
		Trader.body_move = 'left'
	if caller_direct == 2:
		if Input.is_action_pressed('ui_a'):
			pass
		else:
			Trader.body_move = 'right'
	if caller_direct == 3:
		Trader.body_move = 'forwards'
	if caller_direct == 4:
		if Input.is_action_pressed('ui_w'):
			pass
		else:
			Trader.body_move = 'backwards'
	if caller_direct == 0:
		Trader.body_move = 'none'
