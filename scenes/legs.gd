extends Node2D
var number_control = 0
var sin_control_one = 0
var sin_control_two = 0
var sin_control_three = 0
var sin_control_four = 0
var sin_control_five = 0
var sin_control_six = 0
var sin_control_seven = 0
var sin_control_eight = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	number_control += 0.2
	sin_control_one = sin(number_control)
	sin_control_two = cos(number_control)
	sin_control_three = sin(number_control)
	sin_control_four = sin(number_control)
	sin_control_five = sin(number_control)
	sin_control_six = sin(number_control)
	sin_control_seven = sin(number_control)
	sin_control_eight = sin(number_control)
	
	
	
	
	$leg_one/leg_one.rotation_degrees = sin_control_one * 15
	$leg_one/leg_one/off.rotation_degrees = (sin_control_one-1) * 20
	$leg_two/leg_two.rotation_degrees = sin_control_two * 15
	$leg_two/leg_two/off.rotation_degrees = (sin_control_two+1) * 20
	
	$leg_three/leg_three.rotation_degrees = sin_control_three * 15
	$leg_three/leg_three/off.rotation_degrees = (sin_control_three-1) * 20
	$leg_four/leg_four.rotation_degrees = sin_control_four * 15
	$leg_four/leg_four/off.rotation_degrees = (sin_control_four+1) * 20
	
	$leg_five/leg_five.rotation_degrees = sin_control_five * 15
	$leg_five/leg_five/off.rotation_degrees = (sin_control_five-1) * 20
	$leg_six/leg_six.rotation_degrees = sin_control_six * 15
	$leg_six/leg_six/off.rotation_degrees = (sin_control_six+1) * 20
	
	$leg_seven/leg_seven.rotation_degrees = sin_control_seven * 15
	$leg_seven/leg_seven/off.rotation_degrees = (sin_control_seven-1) * 20
	$leg_eight/leg_eight.rotation_degrees = sin_control_eight * 15
	$leg_eight/leg_eight/off.rotation_degrees = (sin_control_eight+1) * 20
