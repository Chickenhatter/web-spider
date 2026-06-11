extends CharacterBody2D
const webfly = preload("res://scenes/webbed fly.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	pass


func _on_flyuntrap_body_entered(body: Node2D) -> void:
	if get_tree().current_scene.scene_file_path == "res://scenes/main.tscn":
		if body.name == "Spider":
			webbed_fly()

func webbed_fly():
	var flyweb = webfly.instantiate()
	flyweb.global_position = $"../Flyparent/CharacterBody2D".global_position
	flyweb.global_rotation = $"../Flyparent/CharacterBody2D".global_rotation
	var webbedflyparent = $"../webbedflyparent"
	webbedflyparent.add_child(flyweb)
