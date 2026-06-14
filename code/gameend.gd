extends Node2D
var spider_died = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spider_died == true:
		$"death fall/Sprite2D".self_modulate.a += 0.01


func _on_death_fall_body_entered(body: Node2D) -> void:
	if body.name == "Spider":
		spider_died = true


func _on_end_game_body_entered(body: Node2D) -> void:
	if body.name == "Spider":
		get_tree().change_scene_to_file("res://scenes/main.tscn")
