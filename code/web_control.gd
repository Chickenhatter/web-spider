extends Node2D
const webscene = preload("res://scenes/web.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_t"):
		if Trader.holding_web == 1:
			web()
func web():
	var webbed = webscene.instantiate()
	webbed.global_position = $"../Spider/Node2D".global_position
	webbed.global_rotation = $"../Spider/Node2D".global_rotation
	var websparent = $"../../Webby"
	websparent.add_child(webbed)
