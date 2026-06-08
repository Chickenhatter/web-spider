extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if web_checker() == true:
		Trader.dans_abdom = true
	else:
		Trader.dans_abdom = false

func web_checker():
	for area in get_overlapping_areas():
		if area.name == "Web":
			return true
	return false
