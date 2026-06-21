extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var a = 25
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Trader.backrestart == true:
		$Red.scale.y += 0.452/5
		$Red.position.y -= 115.0/5
		Trader.backrestart = false
	size_change(0.01)
	if $Red.scale.y < 0.02:
		Trader.dead = true
		$"..".set_collision_layer_value(1, false)
		$"..".set_collision_mask_value(1, false)
	if $Red.scale.y > 0.452:
		$Red.scale.y = 0.452
	if $Red.position.y < 115.0:
		$Red.position.y = 115
func size_change(a):
	$Red.scale.y -= 0.005 * a
	$Red.position.y += 0.7 * a
