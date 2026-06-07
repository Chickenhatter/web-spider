extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if Trader.dans_area == false:
		if not is_on_floor():
			velocity += get_gravity() * delta
	else:
		var movement = Vector2.ZERO
		if Input.is_action_pressed('ui_w'):
			movement = Vector2.UP.rotated(deg_to_rad(rotation_degrees))
		if Input.is_action_pressed('ui_s'):
			movement = Vector2.DOWN.rotated(deg_to_rad(rotation_degrees))
		if Input.is_action_pressed('ui_a'):
			$".".rotation_degrees -= 1
		if Input.is_action_pressed('ui_d'):
			$".".rotation_degrees += 1
		velocity = movement * 300
	move_and_slide()
