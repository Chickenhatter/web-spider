extends Node2D
var spider_died = false
var game_start = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spider_died == true:
		$"death fall/Sprite2D".self_modulate.a += 0.01
	elif game_start == true:
		if $"death fall/Sprite2D".self_modulate.a > 0:
			$"death fall/Sprite2D".self_modulate.a -= 0.01
		else:
			game_start = false


func _on_death_fall_body_entered(body: Node2D) -> void:
	if body.name == "Spider":
		spider_died = true


func _on_end_game_body_entered(body: Node2D) -> void:
	if body.name == "Spider":
		get_tree().change_scene_to_file("res://scenes/end.tscn")
