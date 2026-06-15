extends Node2D
var fade = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Trader.fear == true:
		$Node2D/Spider/Spider/Sprite2D.self_modulate.a = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fade == true:
		$Sprite2D.self_modulate.a += 0.01
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_start_pressed() -> void:
	fade = true


func _on_fear_pressed() -> void:
	Trader.fear = true
