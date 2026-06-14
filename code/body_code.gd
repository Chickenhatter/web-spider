extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Trader.backrestart == true:
		$Red.scale.y = 0.344
		$Red.position.y = 115.0
		Trader.backrestart = false
	size_change(0.01)
	if $Red.scale.y < 0:
		$"..".set_collision_layer_value(1, false)
		$"..".set_collision_mask_value(1, false)

func size_change(a):
	$Red.scale.y -= 0.005 * a
	$Red.position.y += 0.7 * a
