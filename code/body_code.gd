extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	size_change(0.01)

func size_change(a):
	$Red.scale.y -= 0.005 * a
	$Red.position.y += 0.7 * a
