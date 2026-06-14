extends Node2D
var number_control_r = 0
var number_control_l = 0
var sin_control_one = 0
var sin_control_two = 0
var sin_control_three = 0
var sin_control_four = 0
var sin_control_five = 0
var sin_control_six = 0
var sin_control_seven = 0
var sin_control_eight = 0

var left = false
var backleft = 0
var backright = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Trader.body_move == "left":
		backleft = 2
		backright = 1
		left = true
	elif Trader.body_move == "right":
		backleft = 1
		backright = 2
		left = true
	elif Trader.body_move == "forwards":
		backleft = 2
		backright = 2
		left = true
	elif Trader.body_move == "backwards":
		backleft = 1
		backright = 1
		left = true
	else:
		backleft = 0
		backright = 0
		left = false
	
	
	
	
	if backleft == 1:
		number_control_l -= 0.2
	elif backleft == 2:
		number_control_l += 0.2
	if backright == 1:
		number_control_r -= 0.2
	elif backright == 2:
		number_control_r += 0.2
	if left == true:
		sin_control_one = sin(number_control_l)
		sin_control_three = sin(number_control_l)
		sin_control_five = sin(number_control_l)
		sin_control_seven = sin(number_control_l)
		sin_control_two = cos(number_control_r)
		sin_control_four = sin(number_control_r)
		sin_control_six = sin(number_control_r)
		sin_control_eight = sin(number_control_r)
	
	
	
	
	if left == true:
		$leg_one/leg_one.rotation_degrees = sin_control_one * 15
		$leg_one/leg_one/off.rotation_degrees = (sin_control_one-1) * 20
		$leg_three/leg_three.rotation_degrees = sin_control_three * 15
		$leg_three/leg_three/off.rotation_degrees = (sin_control_three-1) * 20
		$leg_five/leg_five.rotation_degrees = sin_control_five * 15
		$leg_five/leg_five/off.rotation_degrees = (sin_control_five-1) * 20
		$leg_seven/leg_seven.rotation_degrees = sin_control_seven * 15
		$leg_seven/leg_seven/off.rotation_degrees = (sin_control_seven-1) * 20
		$leg_two/leg_two.rotation_degrees = sin_control_two * 15
		$leg_two/leg_two/off.rotation_degrees = (sin_control_two+1) * 20
		$leg_four/leg_four.rotation_degrees = sin_control_four * 15
		$leg_four/leg_four/off.rotation_degrees = (sin_control_four+1) * 20
		$leg_six/leg_six.rotation_degrees = sin_control_six * 15
		$leg_six/leg_six/off.rotation_degrees = (sin_control_six+1) * 20
		$leg_eight/leg_eight.rotation_degrees = sin_control_eight * 15
		$leg_eight/leg_eight/off.rotation_degrees = (sin_control_eight+1) * 20
